---@class trouble.Config
---@field config? fun(opts:trouble.Config)
local opts = {
  focus = true,
  auto_close = true,
  modes = {
    mydiags = {
      mode = 'diagnostics', -- inherit from diagnostics mode
      filter = {
        any = {
          buf = 0, -- current buffer
          {
            severity = vim.diagnostic.severity.ERROR, -- errors only
            -- limit to files in the current project
            function(item)
              return item.filename:find((vim.loop or vim.uv).cwd(), 1, true)
            end,
          },
        },
      },
    },
    preview_float = {
      mode = 'diagnostics',
      preview = {
        type = 'float',
        relative = 'editor',
        border = 'rounded',
        title = 'Preview',
        title_pos = 'center',
        position = { 0, -2 },
        size = { width = 0.3, height = 0.3 },
        zindex = 200,
      },
    },
  },
}
return {
  {
    'folke/trouble.nvim',
    opts = opts,
    cmd = 'Trouble',
    keys = {
      {
        '<leader>dd',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>dw',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Workspace Diagnostics (Trouble)',
      },
      {
        '<leader>dX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>ds',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>dl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>dL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>dQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },
}
