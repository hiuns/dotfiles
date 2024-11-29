if [[ $# -eq 1 ]]; then
    selected=~/Developer/$1
else
    # Use fzf to select a directory
    # selected=$(find ~/Developer -mindepth 1 -maxdepth 1 -type d)
    echo "Error: Directory '$selected' does not exist."
    exit 1
fi

if [[ -z $selected ]]; then
    exit 0
fi

# Check if the resolved path exists
if [[ ! -d $selected ]]; then
    echo "Error: Directory '$selected' does not exist."
    exit 1
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi

tmux switch-client -t $selected_name

