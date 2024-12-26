####### zsh display: user directory branch $ #######
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1] /p'
}
COLOR_DEF=$'%f'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{39}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DIR}%2~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}$ '
####### alias ######################################
alias dc="cd"
alias sl="ls"
alias vim="nvim"
function mkcd {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
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
run_venv() {
    if [ ! -d ".venv" ]; then
        echo "Venv doesn't exist"
    else
        source .venv/bin/activate
    fi
}
build_venv() {
    # Create a virtual environment if it doesn't already exist
    if [ ! -d ".venv" ]; then
        python3 -m venv .venv
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

