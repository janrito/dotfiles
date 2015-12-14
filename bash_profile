# inspired by https://github.com/cowboy/dotfiles/blob/master/link/.bashrc

# Source all files in ~/.dotfiles/environment/
function src() {
  local file
  if [[ "$1" ]]; then
    source "$HOME/.dotfiles/environment/$1.sh"
  else
    for file in ~/.dotfiles/environment/*; do
      source "$file"
    done
  fi
}

src