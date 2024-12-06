####### zsh settings ###############################
function appendPath {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}
function appendLeftPath {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}
appendLeftPath $HOME/.local/bin
####################################################

####### zsh display: user directory branch $ #######
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1] /p'
}
COLOR_DEF=$'%f'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{39}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DIR}%2~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}$ '
####################################################

####### alias ######################################
alias cdd="cd ~/Developer && ls"
alias dc="cd"
alias sl="ls"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias tks="tmux kill-session"
alias tkas="tmux kill-server"
alias gs="git status"
alias gb="git branch"
alias gp="git pull"
alias gd="git diff"
alias gms="git merge --squash"
alias gam="git add . && git commit --amend"
function gac {
  if [ $# -eq 0 ]; then
    echo "Enter a commit message"
  else
    git commit -a -m "$*"
  fi
}
function gcp {
  if [ $# -eq 0 ]; then
    echo "Enter a commit message"
  else
    git add . && git commit -m "$*" && git push
  fi
}
function mkcd {
  if [ ! -n "$1" ]; then
    echo "Enter a directory name"
  elif [ -d $1 ]; then
    echo "\`$1' already exists"
  else
    mkdir $1 && cd $1
  fi
}
####################################################

######## python venv setup #########################
alias p="python3"
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
    echo "To activate the virtual environment, run: source .venv/bin/activate"
    echo "To deactivate, simply run: deactivate"
}
####################################################

