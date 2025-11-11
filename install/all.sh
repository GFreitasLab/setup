#!/usr/bin/env bash
set -euo pipefail

green="\e[32m"
yellow="\e[33m"
red="\e[31m"
reset="\e[0m"
info() { echo -e "${green}==>${reset} $1"; }

install_pkgs() {
  info "Instalando: $1"
  shift
  sudo pacman -S --needed --noconfirm "$@"
}

add_chaotic_repo() {
  if [[ $EUID -ne 0 ]]; then
    echo -e "${red}Este trecho precisa ser executado como root. Use: sudo $0${reset}"
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
  webp-pixbuf-loader btrfs-assistant
)

dev_pkgs=(
  git nodejs luarocks stow tmux zsh neovim kitty python docker docker-compose
)

wayland_pkgs=(
  hyprland hyprlock waybar rofi-wayland wl-clipboard grimblast swww ly thunar imv mpv
)

apps_aur_pkgs=(
  brave-bin obsidian waypaper-git yay
)

info "Iniciando configuração"

info "Instalando chaotic-aur"
sudo bash -c "$(declare -f add_chaotic_repo); add_chaotic_repo"

info "Atualizando repositórios"
sudo pacman -Syy

install_pkgs "Base do sistema" "${base_pkgs[@]}"
install_pkgs "Rede e Bluetooth" "${network_pkgs[@]}"

info "Configurando serviços de rede"
sudo systemctl disable --now iwd.service || true
sudo systemctl enable --now NetworkManager.service
sudo systemctl enable --now sshd.service

install_pkgs "Áudio" "${audio_pkgs[@]}"
install_pkgs "Utilitários" "${utils_pkgs[@]}"
install_pkgs "Desenvolvimento" "${dev_pkgs[@]}"

info "Adicionando o usuário ao grupo docker"
sudo usermod -aG docker "$USER"

install_pkgs "Ambiente gráfico (Wayland)" "${wayland_pkgs[@]}"

info "Ativando o login manager ly"
sudo systemctl enable ly.service

info "Instalando pacotes do AUR com yay"
if ! command -v yay &>/dev/null; then
  info "yay não encontrado, instalando..."
  git clone https://aur.archlinux.org/yay.git /tmp/yay
  pushd /tmp/yay >/dev/null
  makepkg -si --noconfirm
  popd >/dev/null
fi
yay -S --needed --noconfirm "${apps_aur_pkgs[@]}"

info "Atualizando o sistema"
sudo pacman -Syu --noconfirm

if [ "$SHELL" != "/usr/bin/zsh" ]; then
  info "Configurando zsh"
  chsh -s /usr/bin/zsh
fi

info "Instalando Oh-My-Zsh (sem abrir shell)"
RUNZSH=no CHSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

info "Clonando plugins do ZSH"
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"
git clone https://github.com/zsh-users/zsh-autosuggestions.git "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"

info "Instalando Tmux Plugin Manager"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

info "Instalação concluída!"
