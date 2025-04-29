-- Set the leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Enable support for Nerd Fonts
vim.g.have_nerd_font = true

-- Load custom modules for lazy loading, options, keymaps, and commands
require 'destin.lazy'
require 'destin.options'
require 'destin.keymaps'
require 'destin.commands'

-- Configure diagnostic display settings
vim.diagnostic.config {
  virtual_text = true, -- Show diagnostics as virtual text
  underline = true, -- Underline diagnostics
}

-- Load the 'matchit' plugin for extended % matching
vim.cmd 'packadd! matchit'
