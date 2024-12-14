#!/bin/bash

CWD="$(pwd)"
HOME_DIR="$HOME"
CONFIG_DIR="$HOME_DIR/.config"

echo $CONFIG_DIR

ln -s "$CWD/tmux.conf" "$HOME_DIR/.tmux.conf"
ln -s "$CWD/vimrc" "$HOME_DIR/.vimrc"
