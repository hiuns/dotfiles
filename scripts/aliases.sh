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
function gcm {
  if [ $# -eq 0 ]; then
    echo "Enter a commit message"
  else
    git commit -m "$*"
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
