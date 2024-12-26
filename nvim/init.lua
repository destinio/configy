require("config.lazy")

local set = vim.opt

set.number = true
set.relativenumber = true
set.shiftwidth = 2

set.tabstop = 2
set.cursorline = true
set.signcolumn = 'yes'

vim.keymap.set({ "n", "v" }, "<space><space>x", "<cmd>source %<cr>", { silent = true })
