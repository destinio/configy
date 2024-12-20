-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Plugins with Lazy
require("config.lazy")

-- Keymaps
-- normal mode
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<space>x", ":.lua<CR>", { silent = true })
vim.keymap.set("n", "<space>p", ":Ex<CR>", { silent = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }), -- all this to clear the old event!
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shiftwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 10
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.updatetime = 50
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.hlsearch = true
vim.opt.undofile = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.o.laststatus = 3
