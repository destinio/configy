#!/bin/bash

CWD="$(pwd)"
HOME_DIR="$HOME"
CONFIG_DIR="$HOME_DIR/.config"
LOCAL_BIN="$HOME_DIR/.local/bin"

# List of file names
FILES=("vimrc" "bashrc" "zshrc" "tmux.conf" "sqliterc")

# Function to create a symbolic link
create_symlink() {
    local target="$1"
    local link="$2"

    if [ -L "$link" ]; then
        echo "Link already exists for $link -> $(readlink -f "$link")"
    elif [ -e "$link" ]; then
        echo "A regular file or directory already exists at $link!"
    elif [ ! -e "$target" ]; then
        echo "Target file $target does not exist!"
    else
        echo "Creating link for $target"
        ln -s "$target" "$link"
    fi
}

# Loop through the list and create symlinks
for file in "${FILES[@]}"; do
    create_symlink "$CWD/$file" "$HOME_DIR/.$file"
done

# Handle nvim directory separately
if [ ! -d "$CONFIG_DIR/nvim" ]; then
    create_symlink "$CWD/nvim/" "$CONFIG_DIR/nvim"
else
    echo "Nvim configuration already exists as a directory!"
fi

if [ ! -f "$HOME_DIR/bin/tome.sh" ]; then
    create_symlink "$CWD/tome.sh" "$LOCAL_BIN/tome"
else
    echo "tome is already installed"
fi
