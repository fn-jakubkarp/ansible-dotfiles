#!/bin/zsh

# Check for required dependencies
for _dep in fd fzf; do
  if ! command -v $_dep &> /dev/null; then
    print -ru2 "[fzf.zsh] Error: $_dep is required but not installed"
    return 1
  fi
done
unset _dep

# ──[ General FZF Look & Feel ]──────────────────────────────
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#CBE0F0,fg+:#CBE0F0,bg:#011423,bg+:#033259
  --color=hl:#0FC5ED,hl+:#24EAF7,info:#FFE073,marker:#47FF9C
  --color=prompt:#E52E2E,spinner:#a277ff,pointer:#47FF9C,header:#44FFB1
  --color=border:#214969,label:#CBE0F0,query:#CBE0F0
  --border=rounded --border-label="lirin" --border-label-pos=0
  --prompt="> " --marker=">" --pointer="◆"
  --separator="─" --scrollbar="│" --info=right
  --margin=0,1 --padding=0,1
  --preview-window="right:60%:wrap:border-rounded"'

# ──[ TMUX Integration ]─────────────────────────────────────
export FZF_TMUX=1
export FZF_TMUX_OPTS='-p 80%,60% --border=rounded'

# ──[ Command Backends ]─────────────────────────────────────
export FZF_DEFAULT_COMMAND="fd -t f --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git"

# ──[ Previews ]─────────────────────────────────────────────
# Set fallback commands for optional tools
[[ -v commands[eza] ]] && _fzf_eza=eza || _fzf_eza=ls
[[ -v commands[bat] ]] && _fzf_bat="bat --style=numbers --color=always" || _fzf_bat="cat -n"
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
  fd --type f --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
  fd --type d --hidden --exclude .git . "$1"
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