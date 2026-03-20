dotfiles_dir := env("HOME") / ".dotfiles"

# Install default config
install:
    uvx dotbot -v -d "{{dotfiles_dir}}" -c default.conf.yaml

# Install default + mac config
install-mac:
    uvx dotbot -v -d "{{dotfiles_dir}}" -c default.conf.yaml mac.conf.yaml
