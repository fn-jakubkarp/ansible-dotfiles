# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# History setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Powerlevel10k
source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run p10k configure or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Autosuggestions
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

# ---- Completion ----
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' 'r:|[._-]=**'
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

eval $(thefuck --alias)

# Nuclear clear: Wipes screen AND scrollback history
alias clear='if [ -n "$TMUX" ]; then clear && tmux clear-history; else clear; fi'
alias cpcat='pbcopy <'
alias sol='solana --url $(grep "cluster =" Anchor.toml | cut -d "\"" -f 2)'



# ---- Load custom settings ----
[[ -f ~/.config/zsh/aliases.zsh ]] && source ~/.config/zsh/aliases.zsh
[[ -f ~/.config/zsh/func.zsh ]] && source ~/.config/zsh/func.zsh
[[ -f ~/.config/fzf/config.zsh ]] && source ~/.config/fzf/config.zsh

# ---- SSH Agent Bitwarden Integration ----
export SSH_AUTH_SOCK="$HOME/.bitwarden-ssh-agent.sock"

# Initialize FZF key bindings
eval "$(fzf --zsh)"
# opencode
export PATH=/Users/jakubkarp/.opencode/bin:$PATH
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"