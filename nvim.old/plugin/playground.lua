--[[
--
--Notes
--
-- api-global
-- api-vimscript - VimScript Fuctions
-- api-command - Command Functions
--
-- nvim_del_current_line
--]]
--

local run_me = function()
  local ret = vim.api.nvim_create_buf(true, true)
  print(vim.inspect(ret))
end

vim.api.nvim_create_user_command("RM", run_me, {})
vim.keymap.set("n", "<space><space>r", "<cmd>RM<CR>", { silent = true })

vim.keymap.set("n", "<space>gb", function()
  local b = vim.api.nvim_get_current_buf()
  print("bufnum:", b)
end, {})

-- Buffers
-- api-buffer
-- nvim_get_current_buf
-- nvim_set_current_buf
-- nvim_buf_is_valid
-- nvim_buf_line_count
-- nvim_buf_set_lines
-- nvim_buf_set_name

-- Lines
-- nvim_get_current_line

-- Tabs
-- nvim_get_current_tabpage
-- nvim_list_tabpages

-- Window
-- nvim_get_current_win
-- nvim_list_wins

-- Terminal
-- nvim_open_term

-- Key Maps
-- nvim_set_keymap -- use vim.keymap
-- vim.keymap.set("n", "<space>ff", ":lua print(124)<CR>", { silent = true })

-- vim.api.nvim_del_keymap("n", "<space>ff")

-- Messages / Notify
-- *highlight-groups* - for colored output
-- vim.api.nvim_echo({ { "Test", "test2" } }, false, {})
-- vim.api.nvim_echo({
--   { "Error: ", "ErrorMsg" },
--   { "File not found.", "WarningMsg" },
-- }, false, {})
-- nvim_notify

-- Run time paths
-- nvim_list_runtime_paths
--
-- -- Command Functions
-- nvim_buf_create_user_command
-- nvim_create_user_command
-- nvim_get_commands
