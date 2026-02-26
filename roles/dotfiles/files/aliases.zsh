
alias gbb='git rev-parse --abbrev-ref HEAD'

# Directory aliases
alias cdd='cd /home/lirin/Dev/'
alias cdb='cd /home/lirin/Dev/nightly-monorepo/nightlyExtension/apps/extension'
alias cpbsh='cdb && source /home/lirin/Dev/local_build.sh'
alias builder='cdb && source /home/lirin/Dev/builder.sh'

# Utility aliases
alias cls='clear'
alias reload='source ~/.zshrc'
alias codezsh='code ~/.zshrc'

# Aliases for installed packages
alias ls='eza --classify=always'
alias la='eza -a --classify=always'
alias ll='eza -l'
alias lla='eza -l -a'
alias cat='batcat'
alias fd='fdfind'  # Use fd command (installed as fdfind)