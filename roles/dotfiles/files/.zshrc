# =============================================================================
# 1. LOAD PATHS
# =============================================================================
[[ -f ~/.local_paths ]] && source ~/.local_paths

# =============================================================================
# 2. LOAD CONFIGURATIONS
# =============================================================================
local ZSH_CONFIG_DIR="$HOME/.config/zsh"

[[ -f "$ZSH_CONFIG_DIR/history.zsh" ]]    && source "$ZSH_CONFIG_DIR/history.zsh"
[[ -f "$ZSH_CONFIG_DIR/completion.zsh" ]] && source "$ZSH_CONFIG_DIR/completion.zsh"
[[ -f "$ZSH_CONFIG_DIR/aliases.zsh" ]]    && source "$ZSH_CONFIG_DIR/aliases.zsh"
[[ -f "$ZSH_CONFIG_DIR/functions.zsh" ]]  && source "$ZSH_CONFIG_DIR/functions.zsh"

# =============================================================================
# 3. OTHER SETTINGS
# =============================================================================
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=**'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

if command -v fzf >/dev/null 2>&1; then eval "$(fzf --zsh)"; fi
if command -v zoxide >/dev/null 2>&1; then eval "$(zoxide init zsh)"; fi
if command -v starship >/dev/null 2>&1; then eval "$(starship init zsh)"; fi