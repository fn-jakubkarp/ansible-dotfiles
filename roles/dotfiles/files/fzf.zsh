#!/bin/zsh

# fzf runs list commands in a subshell; zsh aliases (e.g. fd -> fdfind) do not apply.
if command -v fdfind &>/dev/null; then
  _fzf_fd_cmd=fdfind
elif command -v fd &>/dev/null; then
  _fzf_fd_cmd=fd
else
  print -ru2 "[fzf.zsh] Error: fd-find (fdfind) or fd is required but not installed"
  return 1
fi

if ! command -v fzf &>/dev/null; then
  print -ru2 "[fzf.zsh] Error: fzf is required but not installed"
  return 1
fi

# ──[ General FZF Look & Feel ]──────────────────────────────
typeset -a _fzf_dotfiles_opts
_fzf_dotfiles_opts=(
  --scheme=path
  --filepath-word
  --tiebreak=begin,length
  --layout=reverse-list
  '--height=~68%'
  --min-height=18
  --cycle
  --color=fg:#8b9eb3,bg:#0f1419,hl:#ffb454
  --color=fg+:#e6edf3,bg+:#1a2332,hl+:#ff8b5c
  --color=info:#9ef5c9,prompt:#5ee0d5,pointer:#ffb454
  --color=marker:#a8e670,spinner:#ff7e93,header:#5ee0d5
  --color=border:#2d3d4d,label:#9ef5c9,query:#e6edf3
  --border=bold
  --border-label=lirin
  --border-label-pos=-4:bottom
  --margin=1,7%,2,7%
  --padding=1,2
  --info=inline-right
  --separator=·
  '--scrollbar=█▏'
  --prompt='›'
  --pointer=▌
  --marker=✓
  --ellipsis=…
  --preview-window=right,58%,wrap,border-bold
  --preview-label=preview
  --preview-label-pos=0:bottom
  --bind=alt-j:preview-half-page-down,alt-k:preview-half-page-up,alt-w:toggle-preview-wrap,ctrl-/:toggle-preview
)
export FZF_DEFAULT_OPTS="${(j: :)_fzf_dotfiles_opts}"
unset _fzf_dotfiles_opts

# ──[ TMUX Integration ]─────────────────────────────────────
export FZF_TMUX=1
export FZF_TMUX_OPTS='-p 88%,72% --border=rounded'

# ──[ Command Backends ]─────────────────────────────────────
export FZF_DEFAULT_COMMAND="$_fzf_fd_cmd -t f --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="$_fzf_fd_cmd --type d --hidden --exclude .git"

# ──[ Previews ]─────────────────────────────────────────────
# Set fallback commands for optional tools
[[ -v commands[eza] ]] && _fzf_eza=eza || _fzf_eza=ls
[[ -v commands[batcat] ]] && _fzf_bat="batcat --style=numbers --color=always" || [[ -v commands[bat] ]] && _fzf_bat="bat --style=numbers --color=always" || _fzf_bat="cat -n"
[[ -v commands[viu] ]] && _fzf_img="viu -w 40 -h 20" || _fzf_img="echo 'Image preview: {}'"
[[ -v commands[ffmpeg] ]] && _fzf_video="ffmpeg -i {} -hide_banner" || _fzf_video="echo 'Video: {}'"

show_file_or_dir_preview='
  if [ -d {} ]; then
    $_fzf_eza --tree --color=always {} | head -200
  else
    mime=$(file --mime-type {} | cut -d" " -f2)
    case "$mime" in
      image/*) $_fzf_img {} ;;
      video/*) $_fzf_video ;;
      text/*|application/json|application/xml) $_fzf_bat {} ;;
      *) file {} ;;
    esac
  fi
'

export FZF_CTRL_T_OPTS="--preview='$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview='$_fzf_eza --tree --color=always {} | head -200'"

# ──[ Completion Hooks ]─────────────────────────────────────
_fzf_compgen_path() {
  "$_fzf_fd_cmd" --type f --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  "$_fzf_fd_cmd" --type d --hidden --exclude .git . "$1"
}

_fzf_comprun() {
  local command=$1; shift
  case "$command" in
    cd) fzf --preview '$_fzf_eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'" "$@" ;;
    ssh) fzf --preview 'dig {}' "$@" ;;
    *) fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}