#!/bin/bash

CWD="$(pwd)"
HOME_DIR="$HOME"
CONFIG_DIR="$HOME_DIR/.config"

ln -s "$CWD/tmux.conf" "$HOME_DIR/.tmux.conf"
ln -s "$CWD/vimrc" "$HOME_DIR/.vimrc"
ln -s "$CWD/bashrc" "$HOME_DIR/.bashrc"

if [ ! -f "$CONFIG_DIR/nvim" ]; then
    ln -s "$CWD/nvim/" "$CONFIG_DIR/nvim"
else
    echo "Nvim is already there man!!!"
fi
