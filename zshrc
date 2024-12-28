# Resolve the real directory of the .zshrc file, even if it's a symlink
ZSHRC_DIR="$(cd "$(dirname "$(realpath "${(%):-%N}")")" && pwd)"
SCRIPTS_DIR="$ZSHRC_DIR/scripts"

# Debug: Print the resolved paths for clarity
# echo "Resolved .zshrc directory: $ZSHRC_DIR"
# echo "Expected scripts directory: $SCRIPTS_DIR"

# Check if the scripts directory exists and is accessible
if [ -d "$SCRIPTS_DIR" ]; then
  # echo "Loading scripts from: $SCRIPTS_DIR"
  for script in "$SCRIPTS_DIR"/*.sh; do
    if [ -r "$script" ]; then
      source "$script"
      # echo "Loaded: $script"
    else
      echo "Skipped unreadable script: $script"
    fi
  done
else
  echo "Error: Directory '$SCRIPTS_DIR' does not exist."
fi
