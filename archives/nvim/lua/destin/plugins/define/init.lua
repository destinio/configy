-- ~/.config/nvim/lua/destin/plugins/define/init.lua
local M = {}

local Popup = require("nui.popup")
local event = require("nui.utils.autocmd").event

M.get_word = function()
  local line = vim.api.nvim_get_current_line()
  local col = vim.api.nvim_win_get_cursor(0)[2] - 1

  local left = vim.fn.matchstr(line:sub(1, col + 1), [[\k*$]])
  local right = vim.fn.matchstr(line:sub(col + 1), [[^\k*]]):sub(2)

  return left .. right
end

M.create_float_vtwo = function(lines)
  local pop = Popup({
    enter = true,
    border = {
      style = "rounded",
      padding = {
        top = 2,
        bottom = 2,
        left = 4,
        right = 4,
      },
    },
    position = "50%",
    size = {
      width = "80%",
      height = "60%",
    },
    win_options = {
      winblend = 10,
    },
  })

  pop:mount()

  pop:on(event.BufLeave, function()
    pop:unmount()
  end)

  vim.api.nvim_buf_set_lines(pop.bufnr, 0, -1, false, lines)
end

vim.api.nvim_create_user_command("DefineIt", function()
  local word = M.get_word()

  -- local cmd = string.format("wn %s -over", word)
  local cmd = "wn " .. word .. " -over"

  local h = io.popen(cmd)

  if h == nil then
    return
  end

  local r = h:read("*a")
  h:close()

  local lines = vim.split(r, "\n", {})

  M.create_float_vtwo(lines)
end, {})

vim.keymap.set("n", "<space><space>d", "<cmd>DefineIt<CR>")

return M
