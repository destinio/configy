-- https://github.com/sschleemilch/slimline.nvim
return {
  'sschleemilch/slimline.nvim',
  opts = {
    style = 'fg',
    configs = {
      diagnostics = {
        workspace = true,
        icons = {
          ERROR = 'E ',
          WARN = 'W ',
          HINT = 'H ',
          INFO = 'I ',
        },
      },
      progress = {
        icon = ' ',
      },
      path = {
        icons = {
          folder = 'F ',
          modified = 'M ',
          read_only = 'R ',
        },
      },
      git = {
        icons = {
          branch = 'B',
          added = '+',
          modified = '~',
          removed = '-',
        },
      },
    },
  },
  setup = function()
    require('slimline').setup {}
  end,
}
