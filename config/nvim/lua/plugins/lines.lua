-- https://github.com/sschleemilch/slimline.nvim
return {
  'sschleemilch/slimline.nvim',
  opts = {
    style = 'fg',
    components = {
      left = {
        'mode',
        'path',
        'git',
      },
      center = {},
      right = {
        'diagnostics',
        -- 'filetype_lsp',
        'progress',
      },
    },
    configs = {
      path = {
        directory = false,
      },
      diagnostics = {
        workspace = true, -- Whether diagnostics should show workspace diagnostics instead of current buffer
        icons = {
          ERROR = 'E ',
          WARN = 'W ',
          HINT = 'H ',
          INFO = 'I ',
        },
      },
      filetype_lsp = {},
    },
  },
  setup = function()
    -- require('slimline').setup {}
  end,
}
