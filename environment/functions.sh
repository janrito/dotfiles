#!/bin/sh
# User command functions (the function counterpart to aliases.sh).

# pretty print path
path() {
  echo "$PATH" | awk 'BEGIN{RS=":"}{$1=$1}1'
}

pyc() {
  find . -name "*.pyc" -delete
}

# Follow a log file (or stdin), pretty-printing JSON lines through jq and
# passing non-JSON lines through unchanged.
#
# Usage:
#   jsonlog app.log               # live follow; JSON pretty/coloured, plain lines verbatim
#   some-command | jsonlog        # pipe/stdin mode
#   jsonlog -                     # explicit stdin mode
#   jsonlog app.log | less -R +F  # page it (Ctrl-C to scroll, Shift-F to resume)
jsonlog() {
  # jq program: $line and fromjson are jq syntax, not shell -> keep single-quoted
  # shellcheck disable=SC2016
  prog='. as $line | try (fromjson | .) catch $line'

  if [ -z "$1" ] || [ "$1" = "-" ]; then
    jq -Rr --unbuffered "$prog"
  else
    tail -F "$1" | jq -Rr --unbuffered "$prog"
  fi
}

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

# update all npm dev dependencies
npm_update_dev() {
  npm outdated -json | jq "to_entries[] | .key + \"@\" + .value.latest" | xargs npm install --save-dev
}

# macOS-only commands
# based on https://github.com/kennethreitz/dotfiles/blob/master/.aliases
if is_osx; then
  battery() {
    pmset -g batt | grep -E "([0-9]+\%).*" -o --colour=auto | cut -f1 -d';'
    pmset -g batt | grep -E "([0-9]+\%).*" -o --colour=auto | cut -f3 -d';'
  }

  ss() {
    open -a ScreenSaverEngine
  }

  lock() {
    /System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend
  }
fi
