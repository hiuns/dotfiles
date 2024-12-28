tmux_session() {
    if [[ $# -eq 1 ]]; then
        selected=~/Developer/$1
    else
        # Use fzf or fallback to an error if no directory is selected
        # Uncomment and use fzf to enable interactive directory selection
        # selected=$(find ~/Developer -mindepth 1 -maxdepth 1 -type d | fzf)
        echo "Error: Directory not provided or selected."
        return 1
    fi

    if [[ -z $selected ]]; then
        return 0
    fi

    # Check if the resolved path exists
    if [[ ! -d $selected ]]; then
        echo "Error: Directory '$selected' does not exist."
        return 1
    fi

    selected_name=$(basename "$selected" | tr . _)
    tmux_running=$(pgrep tmux)

    if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
        tmux new-session -s "$selected_name" -c "$selected"
        return 0
    fi

    if ! tmux has-session -t="$selected_name" 2> /dev/null; then
        tmux new-session -ds "$selected_name" -c "$selected"
    fi

    tmux switch-client -t "$selected_name"
}

