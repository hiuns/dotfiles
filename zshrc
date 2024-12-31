# Resolve the real directory of the .zshrc file, even if it's a symlink
ZSHRC_DIR="$(cd "$(dirname "$(realpath "${(%):-%N}")")" && pwd)"
SHELL_DIR="$ZSHRC_DIR/shell"

# Debug: Print the resolved paths for clarity
# echo "Resolved .zshrc directory: $ZSHRC_DIR"
# echo "Expected shell directory: $SHELL_DIR"

# Check if the shell directory exists and is accessible
if [ -d "$SHELL_DIR" ]; then
  # echo "Loading shell from: $SHELL_DIR"
  for script in "$SHELL_DIR"/*.sh; do
    if [ -r "$script" ]; then
      source "$script"
      # echo "Loaded: $script"
    else
      echo "Skipped unreadable script: $script"
    fi
  done
else
  echo "Error: Directory '$SHELL_DIR' does not exist."
fi
