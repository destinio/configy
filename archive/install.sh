#!/bin/bash

CWD="$(pwd)"
HOME_DIR="$HOME"
CONFIG_DIR="$HOME_DIR/.config"
XDG_CONFIG_HOME="$CONFIG_DIR"
HOME_LOCAL_BIN="$HOME_DIR/.local/bin"

# functions
## Function to create a symbolic link
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

# Create the .config directory if it doesn't exist TODO: don't need this as -p work below
if [ ! -d "$CONFIG_DIR" ]; then
  echo "Creating $CONFIG_DIR"
  mkdir -p "$CONFIG_DIR"
fi

# List of file names
HOME_FILES=("vimrc" "bashrc" "aliases" "tmux.conf" "sqliterc")
HOME_DIRS=()
CONFIG_DIRS=("nvim" "ghostty" "aerospace")
BIN_FILES=("d-ready-parent" "doit" "newproj")

# Loop through the list and create symlinks
for file in "${HOME_FILES[@]}"; do
  create_symlink "$CWD/home/$file" "$HOME_DIR/.$file"
done

# Loop through the list of directories and create symlinks
for dir in "${HOME_DIRS[@]}"; do
  create_symlink "$CWD/home/$dir" "$CONFIG_DIR/$dir"
done

# Loop through the list of config directories and create symlinks
for dir in "${CONFIG_DIRS[@]}"; do
  if [ ! -d "$CONFIG_DIR/$dir" ]; then
    create_symlink "$CWD/config/$dir" "$CONFIG_DIR/$dir"
  else
    echo "$dir already exists as a directory!"
  fi
done

# Loop through the list of bin files and create symlinks
for file in "${BIN_FILES[@]}"; do
  create_symlink "$CWD/bin/$file" "$HOME_LOCAL_BIN/$file"
done
