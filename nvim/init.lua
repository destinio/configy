-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Plugins with Lazy
require("config.lazy")

-- Keymaps

-- normal mode
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", {  silent = true })
vim.keymap.set("n", "<space>x", ":.lua<CR>", { silent = true })
vim.keymap.set("n", "<space>p", ":Ex<CR>", { silent = true })

-- visual mode
vim.keymap.set("v", "<space>x", ":.lua<CR>", {  silent = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }), -- all this to clear the old event!
  callback = function()
    vim.highlight.on_yank()
  end
})

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
