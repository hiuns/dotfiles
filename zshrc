####### zsh display: user directory branch $ #######
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1] /p'
}
COLOR_DEF=$'%f'
# COLOR_USR=$'%F{243}'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{39}'
setopt PROMPT_SUBST
# export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%2~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}$ '
export PROMPT='${COLOR_DIR}%2~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}$ '

# go to project right away
cd ~/Developer && ls
####################################################

####### alias ######################################
alias v="nvim"
alias vim="nvim"

alias gs="git status"
alias gb="git branch"
alias gp="git pull"
alias ga="git add ."
alias gd="git diff"
####################################################

####### mkdir && cd ################################
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
setup_python_venv() {
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

