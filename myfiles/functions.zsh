#!/usr/bin/env zsh


for dots in {2..6}; do
  alias $(printf '%.0s.' $(seq $dots))="cd $(printf '../%.0s' $(seq $((dots - 1))))"
done

# Tree view using eza
function tree() {
    if [[ -z "$1" ]]; then
        eza --tree --level=2
    else
        eza --tree --level=$1
    fi
}

alias update='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'
if command -v task &> /dev/null; then
  alias update='task -g upgrade'
fi



# Git Add via FZF
fzf-git-add() {
  git status --short | fzf --ansi --multi \
    --preview='git diff --color=always -- {}' \
    | awk '{print $2}' | xargs -r git add
}

# Git Commit via FZF
fzf-git-commit() {
  fzf-git-add && git commit -v
}

# Git Log Browser
fzf-git-log() {
  git log --oneline --graph --color=always --all | \
    fzf --ansi --no-sort --reverse --tiebreak=index \
        --preview 'git show --color=always $(echo {} | cut -d" " -f2)' \
        --bind 'enter:execute:git checkout $(echo {} | cut -d" " -f2)'
}

# History Search
fzf-history-widget() {
  local selected=$(fc -rl 1 | fzf +s --tac --preview 'echo {}')
  if [ -n "$selected" ]; then
    LBUFFER="${selected#* }"
  fi
  zle reset-prompt
}
zle -N fzf-history-widget
bindkey '^R' fzf-history-widget

# TMUX Wrapper
fzf-tmux-popup() {
  fzf-tmux -p 80%,60% -- "$@"
}
alias fzfp='fzf-tmux-popup'

function tmcs() {
    # Colors
    local p="\e[1;32m"   # Prefix (Green)
    local k="\e[1;34m"   # Keys (Blue)
    local c="\e[1;33m"   # Command description (Yellow)
    local r="\e[0m"      # Reset
    local dim="\e[2m"    # Dimmed

    echo ""
    echo -e "  ${c}TMUX CHEATSHEET${r} (Prefix: ${p}Ctrl + space${r})"
    echo -e "  ${dim}----------------------------------------${r}"
    
    # Session & Window Management
    printf "  ${p}Pre${r} + ${k}d${r}          %s\n" "Detach session (leave running)"
    printf "  ${p}Pre${r} + ${k}s${r}          %s\n" "List/Switch sessions"
    printf "  ${p}Pre${r} + ${k}w${r}          %s\n" "Window Tree (overview)"
    printf "  ${p}Pre${r} + ${k}c${r}          %s\n" "Create new window"
    printf "  ${p}Pre${r} + ${k},${r}          %s\n" "Rename current window"
    printf "  ${p}Pre${r} + ${k}n / p${r}      %s\n" "Next / Previous window"

    echo -e "  ${dim}----------------------------------------${r}"
    
    # Pane Management
    printf "  ${p}Pre${r} + ${k}|${r}          %s\n" "Split Vertical   ( | )"
    printf "  ${p}Pre${r} + ${k}-${r}          %s\n" "Split Horizontal ( - )"
    printf "  ${p}Pre${r} + ${k}x${r}          %s\n" "Kill current pane"
    printf "  ${p}Pre${r} + ${k}z${r}          %s\n" "Toggle Zoom (fullscreen)"
    
    echo -e "  ${dim}----------------------------------------${r}"
    
    # Navigation & Resizing
    # Note: Using vim-tmux-navigator plugin (No prefix needed for nav)
    printf "  ${k}Ctrl${r} + ${k}h/j/k/l${r}   %s\n" "Navigate Panes (Left/Down/Up/Right)"
    printf "  ${p}Pre${r} + ${k}h/j/k/l${r}    %s\n" "Resize Panes"
    
    echo -e "  ${dim}----------------------------------------${r}"
    
    # Copy Mode (Vi style)
    printf "  ${p}Pre${r} + ${k}[${r}          %s\n" "Enter Copy Mode"
    printf "      ${k}v${r} / ${k}C-v${r}      %s\n" "Start Selection / Block Selection"
    printf "      ${k}y${r}            %s\n" "Copy to system clipboard"
    printf "      ${k}q${r}            %s\n" "Quit Copy Mode"
    
    echo -e "  ${dim}----------------------------------------${r}"
    
    # System
    printf "  ${p}Pre${r} + ${k}r${r}          %s\n" "Reload tmux.conf"
    printf "  ${p}Pre${r} + ${k}I${r}          %s\n" "Install Plugins (TPM)"
    echo ""
}