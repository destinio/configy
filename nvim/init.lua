vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("config.lazy")

local set = vim.opt

set.number = true
set.relativenumber = true
set.shiftwidth = 4
set.signcolumn = "yes"
set.scrolloff = 10
set.showmode = false
set.swapfile = false
set.backup = false
set.updatetime = 50
set.timeoutlen = 300
set.splitright = true
set.splitbelow = true
set.hlsearch = true
set.undofile = true
set.list = true
set.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
set.inccommand = "split"
set.cursorline = true
set.shiftwidth = 2
set.tabstop = 2

vim.o.laststatus = 3

vim.keymap.set({ "n", "v" }, "<space><space>x", "<cmd>source %<cr>", { silent = true })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
