local get_word = function()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] - 1

  local left = vim.fn.matchstr(line:sub(1, col + 1), [[\k*$]])
  local right = vim.fn.matchstr(line:sub(col + 1), [[^\k*]]):sub(2)

  return left .. right
end

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_user_command('DefineIt', function()
  local Popup = require 'nui.popup'
  local event = require('nui.utils.autocmd').event

  local word = get_word()
  local cmd = 'wn ' .. word .. ' -over'

  local h = io.popen(cmd)

  if h == nil then
    return
  end

  local r = h:read '*a'
  h:close()

  local lines = vim.split(r, '\n', {})

  local pop = Popup {
    enter = true,
    border = {
      style = 'rounded',
      padding = {
        top = 2,
        bottom = 2,
        left = 4,
        right = 4,
      },
    },
    position = '50%',
    size = {
      width = '80%',
      height = '60%',
    },
    win_options = {
      winblend = 10,
    },
  }

  pop:mount()

  pop:on(event.BufLeave, function()
    pop:unmount()
  end)

  vim.api.nvim_buf_set_lines(pop.bufnr, 0, -1, false, lines)
end, {})
