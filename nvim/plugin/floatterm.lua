--[[
--
--All thing's built in Terminal
-- :h terminal
--]]
local state = {
  floating = {
    win = -1,
    buf = -1,
  },
}

local function create_floating_window(opts)
  opts = opts or {}

  local width = opts.width or math.floor(vim.o.columns * 0.8)
  local height = opts.height or math.floor(vim.o.lines * 0.8)
  local buf = nil

  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  if vim.api.nvim_buf_is_valid(opts.buf) then
    buf = opts.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
  }

  local win = vim.api.nvim_open_win(buf, true, win_config)

  return { buf = buf, win = win }
end

local toggle_term = function()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    state.floating = create_floating_window({ buf = state.floating.buf })
    if vim.bo[state.floating.buf].buftype ~= "terminal" then
      vim.cmd.term()
    end
  else
    vim.api.nvim_win_hide(state.floating.win)
  end
end

-- User commands
vim.api.nvim_create_user_command("FloatTerm", toggle_term, {})

-- Auto commands

-- Not really used yet
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("term-open", { clear = true }), -- all this to clear the old event!
  callback = function()
    -- add configs here
    -- quick leave terminal
    print("testseting")
  end,
})

-- Keys

-- floating
vim.keymap.set({ "n", "t" }, "<space>tf", toggle_term, { silent = true, desc = "Floating Term" })

-- left
vim.keymap.set("n", "<space>tl", function()
  vim.cmd.vnew()
  vim.cmd.term()
end, { silent = true, desc = "Term Right" })

-- bottom
vim.keymap.set("n", "<space>tj", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J") -- need to have J set to move windown see init.lua
  vim.api.nvim_win_set_height(0, 5)
end, { silent = true, desc = "Term bottom" })

-- new tab
vim.keymap.set("n", "<space>tt", function()
  vim.cmd.tabnew() -- Open a new tab
  vim.cmd.term() -- Start a terminal
end, { silent = true, desc = "Term bottom in new tab" })
