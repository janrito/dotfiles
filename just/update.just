# Update every package manager and tool installer
all: brew zim uv pipx gh rust

# Update Homebrew, then upgrade installed formulae and casks
brew:
    brew update
    brew upgrade
    brew bundle
    brew cleanup

# Upgrade zimfw, then update zim's modules
zim:
    zsh "$ZIM_HOME/zimfw.zsh" upgrade
    zsh "$ZIM_HOME/zimfw.zsh" update

# Upgrade tools installed with uv
uv:
    uv tool upgrade --all

# Upgrade apps installed with pipx
pipx:
    pipx upgrade-all

# Upgrade gh extensions
gh:
    gh extension upgrade --all

# Update the Rust toolchains
rust:
    rustup update
