local set = vim.keymap.set
local opts = { silent = true }

-- General
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Quickfix
set('n', '<leader>qq', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window navigation
set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

set('v', '<leader>fw', ":'<,'>!fmt -w 80<CR>", { desc = '[W]rap text 80' })

-- Terminal mode
set('t', 'jk', [[<C-\><C-n>]], opts)
set('t', 'jj', [[<C-\><C-n>]], opts)
set('t', 'kk', [[<C-\><C-n>]], opts)

-- Custom keymaps
-- Insert file name without extension inline
function InsertFileNameNoExt()
  local filename = vim.fn.expand '%:t:r'
  local keys = vim.api.nvim_replace_termcodes(filename, true, false, true)

  vim.api.nvim_feedkeys(keys, 'i', true)

  print(keys)
end

vim.keymap.set('i', '<C-f>', InsertFileNameNoExt, { desc = 'Insert file name without extension' })
