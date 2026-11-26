# Update package managers and tool installers
mod update 'just/update.just'

# Install default config
install:
    uvx dotbot -v -d "{{ justfile_directory() }}" -c default.conf.yaml

# Install default + mac config
install-mac:
    uvx dotbot -v -d "{{ justfile_directory() }}" -c default.conf.yaml mac.conf.yaml

# Link the admin user's zsh startup files to these dotfiles (asks for its password)
install-admin:
    su "${ASADMIN_USER:-administrator}" -c 'uvx dotbot -v -d "{{ justfile_directory() }}" -c admin.conf.yaml'

# Run all checks (non-mutating)
check: check-shell check-json check-yaml check-toml

# Apply all formatters (mutating)
fmt: fmt-json fmt-yaml fmt-toml

# Lint shell scripts with shellcheck
check-shell:
    shellcheck $(git ls-files '*.sh')

# Lint + format-check JSON with biome
check-json:
    biome check $(git ls-files '*.json' '*.jsonc')

# Lint + auto-format JSON with biome
fmt-json:
    biome check --write $(git ls-files '*.json' '*.jsonc')

# Lint + format-check YAML with biome
check-yaml:
    biome check $(git ls-files '*.yaml' '*.yml')

# Lint + auto-format YAML with biome
fmt-yaml:
    biome check --write $(git ls-files '*.yaml' '*.yml')

# Format-check TOML with taplo via npx
check-toml:
    npx @taplo/cli@latest format --check

# Auto-format TOML with taplo via npx
fmt-toml:
    npx @taplo/cli@latest format
