# Initialize pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Run an existing virtual environment
run_venv() {
  if [ ! -d ".venv" ]; then
    echo "Venv doesn't exist"
  else
    source .venv/bin/activate
  fi
}

# Build or activate a virtual environment
build_venv() {
  local python_cmd="python3" # Default to python3 (macOS)
  if [ -f ".python-version" ]; then
    python_cmd="python"
  fi

  if [ ! -d ".venv" ]; then
    "$python_cmd" -m venv .venv
    echo "Virtual environment created."
  else
    echo "Virtual environment already exists."
  fi

  source .venv/bin/activate

  if [ -f "requirements.txt" ]; then
    pip install -r requirements.txt
    echo "Dependencies installed from requirements.txt."
  else
    echo "requirements.txt not found."
  fi

  echo "To deactivate, simply run: deactivate"
}

# Automatically activate a virtual environment
auto_activate_venv() {
  local current_dir="$PWD"
  local venv_dir

  while [[ -n "$current_dir" ]]; do
    if [[ -d "$current_dir/.venv" ]]; then
      venv_dir="$current_dir/.venv"
      break
    fi
    current_dir="${current_dir%/*}"
  done

  if [[ -n "$venv_dir" ]]; then
    if [[ -n "$VIRTUAL_ENV" && "$VIRTUAL_ENV" != "$venv_dir"* ]]; then
      deactivate
      source "$venv_dir/bin/activate"
    elif [[ -z "$VIRTUAL_ENV" ]]; then
      source "$venv_dir/bin/activate"
    fi
  else
    if [[ -n "$VIRTUAL_ENV" ]]; then
      deactivate
    fi
  fi
}

# Auto-activate venv on directory change
autoload -U add-zsh-hook
add-zsh-hook chpwd auto_activate_venv
auto_activate_venv

