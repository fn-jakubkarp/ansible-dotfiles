#!/usr/bin/env zsh

# Tree view using eza
function tree() {
    if [[ -z "$1" ]]; then
        eza --tree --level=2
    else
        eza --tree --level=$1
    fi
}

# Convert video to MP4 format
cv() {
  echo "Enter input file name (e.g., IMG_4725.MP4):"
  read input_file
  echo "Enter output file name (e.g., output.mp4):"
  read output_file
  ffmpeg -i "$input_file" -vcodec libx264 -crf 28 "$output_file"
}

alias update='sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y'
if command -v task &> /dev/null; then
  alias update='task -g upgrade'
fi