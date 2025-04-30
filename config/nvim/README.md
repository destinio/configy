## NOTES

### Install

#### script
`./install.sh`

#### manual
- https://github.com/neovim/neovim/blob/master/INSTALL.md#macos--os-x
- navigate to
  - https://github.com/neovim/neovim/releases
- download
  - `nvim-macos-arm64.tar.gz`
  - see Assets section
- run
  - `xattr -c ./nvim-macos-arm64.tar.gz`
    - (to avoid "unknown developer" warning)
- extract
  - `tar xzvf nvim-macos-arm64.tar.gz`
- navigate to
  - `cd ~/.local/bin/`
- create symlink
  - `ln -s ~/apps/nvim-macos-arm64/bin/nvim nvim`
    - example ls
      - `nvim@ -> /Users/destin/apps/nvim-macos-arm64/bin/nvim`




## To Read
- omnifunc - `<C_x> C_o>` - `:h ins-completion`