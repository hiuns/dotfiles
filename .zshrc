
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PS1="\$ "
export EDITOR=vim
export VISUAL=vim
export PATH="/home/username/miniconda/bin:$PATH"
alias p="python3"
alias re="zsh"
alias epi="cd epi/epi_judge_python"
alias gs="git status"
alias gb="git branch"
alias ga="git add ."
alias gcm="git checkout main"
alias gplom="git pull origin main"
alias gpsom="git push origin main"
alias grm="git rebase main"
alias compile="g++ -std=c++17 main.cc -o main && ./main"
