#!/bin/sh

# word diff
wd() {
  git wdiff "$@"
  #git diff --no-index --patience --word-diff=plain "$@"
}

# other
alias ll="eza --long --binary --group --header --links --inode --blocksize --git --icons"

# code insiders short
alias ci="code-insiders"

# make gifs
mov_to_gif() {
  tmp_palette=$(mktemp /tmp/mov_to_gif_palette.png)
  tmp_gif=$(mktemp /tmp/mov_to_gif_palette.gif)

  success=$(ffmpeg -i "$1" -filter_complex "[0:v] palettegen" -y "$tmp_palette" &&
    ffmpeg -i "$1" -i "$tmp_palette" -filter_complex "[0:v][1:v] paletteuse" -f gif -y "$tmp_gif" &&
    gifsicle -O3 "$tmp_gif" -o "${1%.*}.gif")

  rm "$tmp_palette" "$tmp_gif"

  if [ "$success" = "0" ]; then
    echo "${1%.*}.gif successfully converted and saved"
  else
    echo "Failed to convert $1 into gif"
  fi

}
