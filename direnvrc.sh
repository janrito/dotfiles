#!/bin/bash

layout_conda() {
  local conda_activate env_file env_name
  conda_activate="${HOMEBREW_PREFIX}/Caskroom/mambaforge/base/bin/activate"
  if [ -n "$1" ]; then
    # Explicit environment name from layout command.
    local env_name="$1"
    # activate named environment
    # shellcheck source=/opt/homebrew/Caskroom/mambaforge/base/bin/activate
    . "$conda_activate" "${env_name}"
  else
    # find environment file
    env_file="$(grep --no-messages -l "name:" .env.yaml .env.yml .environment.yaml .environment.yml environment.yaml environment.yml | head -n 1)"
    if [ -f "$env_file" ]; then
      env_name="$(grep name: "$env_file" | sed -e 's/name: //' | cut -d "'" -f 2 | cut -d '"' -f 2)"
      # activete environment from file
      # shellcheck source=/opt/homebrew/Caskroom/mambaforge/base/bin/activate
      . "$conda_activate" "${env_name}"

    else
      printf "No environment specified\n"
      exit 1
    fi
  fi
}

layout_poetry() {
  PYPROJECT_TOML="${PYPROJECT_TOML:-pyproject.toml}"
  if [[ ! -f "$PYPROJECT_TOML" ]]; then
    log_status "No pyproject.toml found. Executing \`poetry init\` to create a \`$PYPROJECT_TOML\` first."
    poetry init
  fi

  if [[ -d ".venv" ]]; then
    VIRTUAL_ENV="$(pwd)/.venv"
  else
    VIRTUAL_ENV=$(
      poetry env info --path 2>/dev/null
      true
    )
  fi

  if [[ -z $VIRTUAL_ENV || ! -d $VIRTUAL_ENV ]]; then
    log_status "No virtual environment exists. Executing \`poetry install\` to create one."
    poetry install
    VIRTUAL_ENV=$(poetry env info --path)
  fi

  PATH_add "$VIRTUAL_ENV/bin"
  export POETRY_ACTIVE=1
  export VIRTUAL_ENV
}
