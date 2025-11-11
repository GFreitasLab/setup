export EDITOR="nvim"
export TERMINAL="kitty"
export VISUAL="nvim"
export BROWSER="brave"
export MANPAGER="nvim +Man!"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_SCREENSHOTS_DIRS="$HOME/Pictures/screenshots"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

bindkey -v
KEYTIMEOUT=10

HISTSIZE=5000
SAVEHIST=5000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -Uz compinit
compinit -C

# Created by `pipx` on 2025-08-21 11:16:29
export PATH="$PATH:/home/gustavo/.local/bin"
