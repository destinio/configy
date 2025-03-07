#!/bin/bash

CWD="$(pwd)"
HOME_DIR="$HOME"
CONFIG_DIR="$HOME_DIR/.config"
XDG_CONFIG_HOME="$CONFIG_DIR"
HOME_LOCAL_BIN="$HOME_DIR/.local/bin"

# Local dirs
LOCAL_DIR=("bin:$HOME/.local/bin/" "config:$HOME/.config/" "home:$HOME/.")

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

for dir in "${LOCAL_DIR[@]}"; do
  # Split the dir into target and link
  local=$(echo $dir | cut -d':' -f1)
  target=$(echo $dir | cut -d':' -f2)

  cd $local

  files=$(find . -type f -maxdepth 1 -mindepth 1)
  dirs=$(find . -type d -maxdepth 1 -mindepth 1)

  if [ ! -z "$files" ]; then
    for file in $files; do
      ## Clearn file name remove ./ from the beginning
      file=$(echo $file | cut -d'/' -f2)
      # echo "$(pwd)/$file -> $target$file"
      create_symlink "$(pwd)/$file" "$target$file"
      # create_symlink $file $target$file
    done
  fi

  if [[ ! -z "$dirs" ]]; then
    for d in $dirs; do
      ## Clearn file name remove ./ from the beginning
      d=$(echo $d | cut -d'/' -f2)
      create_symlink "$(pwd)/$d $target$file"
      # create_symlink $d $target$d
    done
  fi

  cd ..
done
