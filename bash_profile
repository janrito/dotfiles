# Add binaries into the path
PATH=~/.bin:$PATH
export PATH

# Source all files in ~/.dotfiles/source/
function src() {
  local file
  if [[ "$1" ]]; then
    source "$HOME/.environment/$1.sh"
  else
    for file in ~/.environment/*; do
      source "$file"
    done
  fi
}


src