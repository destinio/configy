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
vim.keymap.set("n", "<space>x", ":.lua<CR>", { silent = true })
vim.keymap.set("n", "<space>p", ":Ex<CR>", { silent = true })

-- visual mode
vim.keymap.set("v", "<space>x", ":.lua<CR>", { silent = true })

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }), -- all this to clear the old event!
  callback = function()
    vim.highlight.on_yank()
  end
})

vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('term-open', { clear = true }), -- all this to clear the old event!
  callback = function()
    -- add configs here
  end
})

local job_id = 0
vim.keymap.set("n", "<space>tt", function()
  vim.cmd.vnew()
  vim.cmd.term()

  job_id = vim.bo.channel
end, { silent = true, desc = "Term" })

vim.keymap.set("n", "<space>tc", function()
  vim.fn.chansend(job_id, { "ls -al\r\n" })
end, { silent = true, desc = "Term with cmd" })

-- Todo: Terminal stuff
-- vim.cmd.wincmd("J") -- put windwow on bottom <C_w>
-- vim.api.nvim_win_set_width(0, 50)
-- make one for new tab
-- small at bottom
-- float
-- :nvim_open_win -- for float
-- Automaticly close Term buffer when exiting

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
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.o.laststatus = 3
