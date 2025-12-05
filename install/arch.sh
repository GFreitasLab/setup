#!/usr/bin/env bash
set -euo pipefail

green="\e[32m"
yellow="\e[33m"
red="\e[31m"
reset="\e[0m"

if [[ $EUID -eq 0 ]]; then
  echo -e "${red}Erro: Este script deve ser executado como USUÁRIO COMUM (sem sudo).${reset}"
  echo -e "${yellow}O script pedirá sua senha EXPLICITAMENTE em cada etapa com sudo.${reset}"
  exit 1
fi

info() { echo -e "${green}==>${reset} $1"; }

install_pkgs() {
  info "Instalando: $1"
  shift
  sudo -k pacman -S --needed --noconfirm "$@"
}

add_chaotic_repo() {
  if [[ $EUID -ne 0 ]]; then
    echo -e "${red}Este trecho precisa ser executado como root.${reset}"
    exit 1
  fi

  info "Atualizando keyring principal"
  pacman -Sy --noconfirm archlinux-keyring

  info "Importando chave GPG do Chaotic-AUR"
  pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
  pacman-key --lsign-key 3056513887B78AEB

  info "Instalando keyring e mirrorlist do Chaotic-AUR"
  pacman -U --noconfirm \
    'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' \
    'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

  if ! grep -q "\[chaotic-aur\]" /etc/pacman.conf; then
    info "Adicionando repositório Chaotic-AUR ao /etc/pacman.conf"
    cat <<'EOF' >>/etc/pacman.conf

[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
EOF
  fi

  info "Chaotic-AUR adicionado com sucesso!"
}

base_pkgs=(
  base base-devel linux linux-firmware intel-ucode efibootmgr
  btrfs-progs exfatprogs snapper zram-generator
)

network_pkgs=(
  networkmanager network-manager-applet blueman bluez bluez-utils openssh
)

audio_pkgs=(
  pipewire pipewire-alsa pipewire-jack pipewire-pulse gst-plugin-pipewire wireplumber libpulse
)

utils_pkgs=(
  brightnessctl power-profiles-daemon udisks2 polkit-gnome rsync tree unzip 7zip fastfetch curl wget
  gvfs gvfs-mtp gvfs-afc gvfs-gphoto2 tumbler ffmpegthumbnailer poppler-glib freetype2 libgsf
  webp-pixbuf-loader btrfs-assistant pavucontrol ufw yazi
)

dev_pkgs=(
  git nodejs luarocks stow tmux zsh neovim kitty python docker docker-compose
)

desktop_pkgs=(
  hyprland hyprlock waybar rofi-wayland wl-clipboard grimblast swww ly thunar imv mpv gammastep flatpak zen-browser-bin
)

apps_aur_pkgs=(
  obsidian
)

info "Iniciando configuração"

info "Instalando chaotic-aur"
sudo -k bash -c "$(declare -f add_chaotic_repo); add_chaotic_repo"

info "Atualizando repositórios"
sudo -k pacman -Syy

install_pkgs "Base do sistema" "${base_pkgs[@]}"
install_pkgs "Rede e Bluetooth" "${network_pkgs[@]}"

info "Configurando serviços de rede"
sudo -k systemctl enable --now NetworkManager.service

if systemctl list-unit-files | grep -q iwd.service; then
  sudo -k systemctl disable --now iwd.service || true
fi
sudo -k systemctl enable --now sshd.service

install_pkgs "Áudio" "${audio_pkgs[@]}"
install_pkgs "Utilitários" "${utils_pkgs[@]}"
install_pkgs "Desenvolvimento" "${dev_pkgs[@]}"

info "Adicionando o usuário ao grupo docker"
sudo -k usermod -aG docker "$USER"

install_pkgs "Ambiente gráfico" "${desktop_pkgs[@]}"

info "Ativando o login manager ly"
sudo -k systemctl enable ly.service

info "Verificando instalação do yay"
if ! command -v yay &>/dev/null; then
  info "yay não encontrado, instalando..."
  rm -rf /tmp/yay
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  pushd /tmp/yay >/dev/null
  makepkg -si --noconfirm
  popd >/dev/null
fi

info "Instalando pacotes extras do AUR"
yay -S --needed --noconfirm "${apps_aur_pkgs[@]}"

info "Atualizando todo o sistema"
sudo -k pacman -Syu --noconfirm

if [ "$SHELL" != "/usr/bin/zsh" ]; then
  info "Configurando zsh como shell padrão"
  sudo -k usermod --shell /usr/bin/zsh "$USER"
fi

if [ ! -d "$HOME/.oh-my-zsh" ]; then
  info "Instalando Oh-My-Zsh"
  RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  info "Oh-My-Zsh já instalado, pulando..."
fi

info "Clonando plugins do ZSH"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
fi

if [ ! -d "$ZSH_CUSTOM/themes/powerlevel10k" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
fi

if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  info "Instalando Tmux Plugin Manager"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

info "Instalação concluída com sucesso! Reinicie o computador."
