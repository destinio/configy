#!/bin/bash

logit() {
  text=$1
  color=$2

  if [[ $color == "-r" ]]; then
    echo -e "\033[31m$text\033[0m"
  elif [[ $color == "-g" ]]; then
    echo -e "\033[32m$text\033[0m"
  elif [[ $color == "-y" ]]; then
    echo -e "\033[33m$text\033[0m"
  else
    echo -e "\033[0m$text\033[0m"
  fi
}

## Function to create a symbolic link
create_symlink() {
  local target="$1"
  local link="$2"

  if [ -L "$link" ]; then
    logit "Link already exists for: " -y
    logit "$link -> $(readlink -f "$link")"
  elif [ -e "$link" ]; then
    logit "A regular file or directory already exists at $link!" -y
  else
    logit "Creating link for $target" -g
    ln -s "$target" "$link"
  fi
}
