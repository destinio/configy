vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

require 'destin.lazy'

require 'destin.options'
require 'destin.keymaps'
require 'destin.commands'

vim.diagnostic.config {
  virtual_text = true,
  underline = true,
}

-- vim: ts=2 sts=2 sw=2 et
