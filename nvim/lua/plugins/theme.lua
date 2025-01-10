return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    integrations = {
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      harpoon = true,
      cmp = true,
      notify = false,
      mini = {
        enabled = true,
        indentscope_color = '',
      },
    },
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        -- https://github.com/catppuccin/catppuccin/blob/main/docs/style-guide.md
        color_overrides = {
          all = {
            text = '#ffffff',
          },
          mocha = {
            base = '#000000',
          },
          latte = {},
          frappe = {},
          macchiato = {},
        },
      }
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
