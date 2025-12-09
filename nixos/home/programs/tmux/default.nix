{ config, pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shortcut = "a";
    baseIndex = 1;
    keyMode = "vi";
    escapeTime = 0;
    terminal = "tmux-256color";
    plugins = with pkgs.tmuxPlugins; [
      sensible
      vim-tmux-navigator
    ];
    extraConfig = ''
      # -- Mouse --
      set -g mouse on
      # -- Status bar --
      set-option -g status-position top
      set -g status-style bg=default,fg=default,bright
      set -g status-left ""
      set -g status-right "#S"
      set -g window-status-format " #W"
      set -g window-status-current-format " #W*"
      # Pane separators
      set -g pane-border-lines simple
      set -g pane-border-style fg=default,bright
      # -- Options --
      set -g renumber-windows on
      set -g set-clipboard on
      set -as terminal-features ',xterm-kitty:clipboard'
      # -- Keybindings - Window Management --
      bind x kill-pane
      bind X kill-window
      # -- Abrir janelas no diretório atual --
      unbind c
      bind c new-window -c "#{pane_current_path}"
      unbind %
      bind | split-window -h -c "#{pane_current_path}"
      unbind '"'
      bind - split-window -v -c "#{pane_current_path}"
      # -- Resize (Alt + hjkl) --
      bind -n M-h resize-pane -L 2
      bind -n M-j resize-pane -D 1
      bind -n M-k resize-pane -U 1
      bind -n M-l resize-pane -R 2
      # -- Copy Mode (Vi Style) --
      bind -T copy-mode-vi q send-keys -X cancel
      bind -T copy-mode-vi Escape send-keys -X cancel
      bind -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind -T copy-mode-vi v send-keys -X begin-selection
      bind -T copy-mode-vi V send-keys -X select-line
    '';
  };
}
