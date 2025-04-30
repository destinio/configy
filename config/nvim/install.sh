#!/bin/bash

OS=$(uname -s)
PROCESSOR=$(uname -m)
OPTIONS=("apple" "linux")
APP_DIR="$HOME/apps"

# Create the apps directory if it doesn't exist
mkdir -p "$APP_DIR"
cd "$APP_DIR"

# use fzf to select the os
SELECTED_OS=$(printf '%s\n' "${OPTIONS[@]}" | fzf --height 40% --reverse --inline-info --info=inline --prompt="Select OS: ")

echo -e "=========================="
echo -e "User Selected OS: $SELECTED_OS"
echo -e "------------------"
echo -e "Detected OS: $OS"
echo -e "Detected Processor: $PROCESSOR"
echo -e "==========================\n"

BASE_URL="https://github.com/neovim/neovim/releases/download/nightly/"
DOWNLOAD_FILE_NAME=""

if [[ $SELECTED_OS == "apple" ]]; then
  if [[ $PROCESSOR == "x86_64" ]]; then
    DOWNLOAD_FILE_NAME="nvim-macos-x86_64.tar.gz"
  elif [[ $PROCESSOR == "arm64" ]]; then
    DOWNLOAD_FILE_NAME="nvim-macos-arm64.tar.gz"
  else
    echo "Unsupported processor architecture: $PROCESSOR"
    exit 1
  fi
elif [[ $SELECTED_OS == "linux" ]]; then
  if [[ $PROCESSOR == "x86_64" ]]; then
    DOWNLOAD_FILE_NAME="nvim-linux-x86_64.tar.gz"
  elif [[ $PROCESSOR == "aarch64" ]]; then
    DOWNLOAD_FILE_NAME="nvim-linux-arm64.tar.gz"
  else
    echo "Unsupported processor architecture: $PROCESSOR"
    exit 1
  fi
else
  echo "Invalid selection"
  exit 1
fi

# set full url
URL="${BASE_URL}${DOWNLOAD_FILE_NAME}"

# Check if the file already exists
if [[ -f "./$DOWNLOAD_FILE_NAME" ]]; then
  echo -e "Deleting old file: $DOWNLOAD_FILE_NAME"
  rm -f "./$DOWNLOAD_FILE_NAME"
fi

# remove tar.gz from $DOWNLOAD_FILE_NAME
APP_FILE_NAME="${DOWNLOAD_FILE_NAME%.tar.gz}"

echo -e "\nDownloading Neovim from\n$URL\n"

# Download the file from the specified URL
curl -L -O "$URL"

# Remove extended attributes from the downloaded file
## This is necessary for macOS to prevent issues with the downloaded file
xattr -c "./$DOWNLOAD_FILE_NAME"

# Extract the contents of the tar.gz file
tar xzvf "./$DOWNLOAD_FILE_NAME" >/dev/null 2>&1

rm -f "./$DOWNLOAD_FILE_NAME"

# Create a symbolic link to the nvim binary
## check if ~/.local/bin exists
if [[ ! -d "$HOME/.local/bin" ]]; then
  mkdir -p "$HOME/.local/bin"
fi

cd "$HOME/.local/bin"
ln -s "$APP_DIR/$APP_FILE_NAME/bin/nvim" "nvim3"

echo -e "\n\n"
echo -e "=========================="
echo -e "Neovim installed successfully!"

exit 0
