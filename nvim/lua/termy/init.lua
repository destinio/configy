local M = {}

-- Open or toggle terminal
function M.right_terminal(opts)
  opts = opts or {}

  local width = math.floor(vim.o.columns * (opts.width or 0.4))

  vim.cmd(width .. 'vsplit | terminal')
end

-- Setup function
function M.setup()
  -- Key Bindings
  vim.keymap.set('n', '<Leader>tt', M.right_terminal, { desc = 'right Terminal' })

  -- User Commands
  vim.api.nvim_create_user_command('TermOpen', function()
    vim.cmd 'split | terminal'
  end, {})

  -- Autocommands
  vim.api.nvim_create_autocmd('TermOpen', {
    callback = function()
      vim.wo.number = false -- Disable line numbers in terminal
      vim.wo.relativenumber = false
      vim.cmd 'startinsert' -- Start in insert mode
    end,
  })
end

return M
