# zsh prompt: display user, directory, and git branch
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1] /p'
}
COLOR_DEF=$'%f'
COLOR_DIR=$'%F{197}'
COLOR_GIT=$'%F{39}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_DIR}%2~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF}$ '

# python
alias svenv="source .venv/bin/activate"

# Basic navigation
alias dc="cd"
alias sl="ls"
alias vim="nvim"

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

# Git commit with a message
function gacm {
  if [ $# -eq 0 ]; then
    echo "Enter a commit message"
  else
    git add . && git commit -m "$*"
  fi
}

# Create and change to a new directory
function mkcd {
  if [ -z "$1" ]; then
    echo "Enter a directory name"
  elif [ -d "$1" ]; then
    echo "\`$1' already exists"
  else
    mkdir "$1" && cd "$1"
  fi
}

