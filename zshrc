####### zsh display: user directory branch $ #######
function parse_git_branch() {
    # Attempt to retrieve current git branch name; suppress errors.
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1] /p'
}

COLOR_DEF=$'%f'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{39}'

# Enable substitution in prompts
setopt PROMPT_SUBST

# Configure prompt to display directory + branch
export PROMPT='${COLOR_DIR}%2~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}$ '

####### alias ######################################
alias dc="cd"
alias sl="ls"
alias vim="nvim"

function mkcd {
  if [ -z "$1" ]; then
    echo "Enter a directory name"
  elif [ -d "$1" ]; then
    echo "\`$1' already exists"
  else
    mkdir "$1" && cd "$1"
  fi
}

# tmux
alias tls="tmux ls"
alias tks="tmux kill-session"
alias tkas="tmux kill-server"

# git
alias gs="git status"
alias gb="git branch"
alias gl="git log"
alias gd="git diff"
alias gp="git push"
alias gpu="git pull"
alias gck="git checkout"
alias ga="git add -p"
alias gam="git add . && git commit --amend"
alias gc="git commit"

function gcm {
  if [ $# -eq 0 ]; then
    echo "Enter a commit message"
  else
    git commit -m "$*"
  fi
}

######## python venv setup #########################
# -- Consider placing these lines into ~/.zprofile 
export PYENV_ROOT="$HOME/.pyenv"

# Only initialize pyenv if it exists
if [ -d "$PYENV_ROOT" ]; then
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

run_venv() {
  if [ ! -d ".venv" ]; then
      echo "Venv doesn't exist"
  else
      source .venv/bin/activate
  fi
}

build_venv() {
  # 1. Check if "python" is available. If not, use "python3".
  #    This way, we can handle systems where "python" is symlinked
  #    to a specific version, and macOS's default is "python3".
  local python_cmd
  if command -v python &>/dev/null; then
    python_cmd="python"
  else
    python_cmd="python3"
  fi

  # Create a virtual environment if it doesn't already exist
  if [ ! -d ".venv" ]; then
      "$python_cmd" -m venv .venv
      echo "Virtual environment created."
  else
      echo "Virtual environment already exists."
  fi

  # Activate the virtual environment
  source .venv/bin/activate

  # Install dependencies from requirements.txt
  if [ -f "requirements.txt" ]; then
      pip install -r requirements.txt
      echo "Dependencies installed from requirements.txt."
  else
      echo "requirements.txt not found."
  fi

  # Inform the user about activation and deactivation
  echo "To deactivate, simply run: deactivate"
}

# Auto activate venv
auto_activate_venv() {
  local current_dir="$PWD"
  local venv_dir

  # Search for a .venv directory in the current directory or any parent directories
  while [[ -n "$current_dir" ]]; do
    if [[ -d "$current_dir/.venv" ]]; then
      venv_dir="$current_dir/.venv"
      break
    fi
    current_dir="${current_dir%/*}"
  done

  # If a .venv directory was found, activate it
  if [[ -n "$venv_dir" ]]; then
    if [[ -n "$VIRTUAL_ENV" && "$VIRTUAL_ENV" != "$venv_dir"* ]]; then
      deactivate
      source "$venv_dir/bin/activate"
    elif [[ -z "$VIRTUAL_ENV" ]]; then
      source "$venv_dir/bin/activate"
    fi
  else
    # If no .venv directory was found, deactivate any active virtual environment
    if [[ -n "$VIRTUAL_ENV" ]]; then
      deactivate
    fi
  fi
}

# Call the auto_activate_venv function when changing directories
autoload -U add-zsh-hook
add-zsh-hook chpwd auto_activate_venv
auto_activate_venv
######################################

