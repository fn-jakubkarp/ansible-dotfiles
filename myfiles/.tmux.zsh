# --- Default settings ---
set -g default-terminal "tmux-256color"
set -ag terminal-overrides ",xterm-256color:RGB"

# Set C+a prefix
unbind C-b
unbind C-a
set -g prefix C-Space
bind C-Space send-prefix

# Fast config reload: Prefix + r
unbind r
bind r source-file ~/.tmux.conf \; display "Reloaded: tmux.conf!"

# Mouse settings
set -g mouse on

# Window and pane indexing (starting from 1)
set -g base-index 1
set -g pane-base-index 1
set-window-option -g pane-base-index 1
set-option -g renumber-windows on

# --- Nav and Panes ---
unbind %
bind | split-window -h -c "#{pane_current_path}"
unbind x
bind x kill-pane
unbind &
bind & kill-window

unbind '"'
bind - split-window -v -c "#{pane_current_path}"

# Change pane size with Ctrl + h/j/k/l (vim style)
bind -r j resize-pane -D 5
bind -r k resize-pane -U 5
bind -r l resize-pane -R 5
bind -r h resize-pane -L 5

# Maximalize pane with  'm'
bind -r m resize-pane -Z

# VI keybindings in copy mode
set-window-option -g mode-keys vi

# --- Copy Mode & Clipboard (OS agnostic) ---
unbind -T copy-mode-vi MouseDragEnd1Pane 

# Vim 'v' to start selection, 'C-v' for rectangle selection
bind-key -T copy-mode-vi 'v' send -X begin-selection 
bind-key -T copy-mode-vi 'C-v' send -X rectangle-toggle

# --- Plugins (TPM) ---
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'christoomey/vim-tmux-navigator' 
set -g @plugin 'tmux-plugins/tmux-yank'         
set -g @plugin 'tmux-plugins/tmux-fzf-url'
set -g @plugin 'tmux-plugins/tmux-prefix-highlight'



# --- Plugin configurations ---
set -g @resurrect-capture-pane-contents 'off'
set -g @continuum-restore 'off'
set -g @fzf-url-bind 'C-u'


# --- Initialization TPM ---
# Keep this here so Catppuccin loads BEFORE we construct the status bar below
run '~/.tmux/plugins/tpm/tpm'