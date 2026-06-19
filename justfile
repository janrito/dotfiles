dotfiles_dir := env("HOME") / ".dotfiles"

# Install default config
install:
    uvx dotbot -v -d "{{dotfiles_dir}}" -c default.conf.yaml

# Install default + mac config
install-mac:
    uvx dotbot -v -d "{{dotfiles_dir}}" -c default.conf.yaml mac.conf.yaml

# Run all checks (non-mutating)
check: check-shell check-json check-yaml check-toml

# Apply all formatters (mutating)
fmt: fmt-json fmt-yaml fmt-toml

# Lint shell scripts with shellcheck
check-shell:
    shellcheck $(git ls-files '*.sh') profile

# Lint + format-check JSON with biome
check-json:
    biome check $(git ls-files '*.json')

# Lint + auto-format JSON with biome
fmt-json:
    biome check --write $(git ls-files '*.json')

# Format-check YAML with prettier via bunx
check-yaml:
    bunx prettier@latest --check "**/*.{yaml,yml}"

# Auto-format YAML with prettier via bunx
fmt-yaml:
    bunx prettier@latest --write "**/*.{yaml,yml}"

# Format-check TOML with taplo via bunx
check-toml:
    bunx @taplo/cli@latest format --check

# Auto-format TOML with taplo via bunx
fmt-toml:
    bunx @taplo/cli@latest format
