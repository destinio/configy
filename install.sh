#!/bin/bash

source ./funcs.sh

clear

HOME_DIR="$HOME"

logit "Welcome let's get ya set UP!!!!\n" -g

MUST_HAVE_DIRS=("$HOME_DIR/.local/bin" "$HOME_DIR/.config" "$HOME_DIR/apps")

# Check if the directories exist, if not create them
for dir in "${MUST_HAVE_DIRS[@]}"; do
  if [ ! -d "$dir" ]; then
    logit "Creating $dir\n" -g
    mkdir -p "$dir"
  fi
done

CONFIG_DIR="$HOME_DIR/.config"

# Local dirs
# Format: "local_dir:target_dir" - this is split into local and target
LOCAL_DIRS=("bin:$HOME/.local/bin/" "config:$HOME/.config/" "home_hidden:$HOME/.")

# Loop over the local dirs
for dir in "${LOCAL_DIRS[@]}"; do
  # Split the dir into target and link
  local=$(echo $dir | cut -d':' -f1)
  target=$(echo $dir | cut -d':' -f2)

  logit "Processing $local....\n" -g

  cd $local

  files=$(find . -type f -maxdepth 1 -mindepth 1)
  dirs=$(find . -type d -maxdepth 1 -mindepth 1)

  if [ ! -z "$files" ]; then
    for file in $files; do
      file=$(echo $file | cut -d'/' -f2)

      if [[ $file == "README.md" ]]; then
        continue
      fi

      create_symlink "$(pwd)/$file" "$target$file"
    done
  fi

  if [[ ! -z "$dirs" ]]; then
    for d in $dirs; do
      d=$(echo $d | cut -d'/' -f2)
      create_symlink "$(pwd)/$d" "$target$d"
    done
  fi

  echo -e "\n"

  cd ..
done
