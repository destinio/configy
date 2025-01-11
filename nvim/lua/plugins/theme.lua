return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    -- https://github.com/catppuccin/nvim?tab=readme-ov-file#integrations
    integrations = {
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      harpoon = true,
      blink_cmp = true,
      neotree = true,
      notify = false,
      mini = {
        enabled = true,
        indentscope_color = '',
      },
    },
    config = function()
      require('catppuccin').setup {
        flavour = 'mocha',
        -- https://github.com/catppuccin/nvim?tab=readme-ov-file#overwriting-highlight-groups
        highlight_overrides = {
          mocha = function(mocha)
            return {
              Pmenu = { bg = mocha.base },
              PmenuSel = { bg = '#202020' },
              -- BlinkCmpMenu = { bg = mocha.base },
            }
          end,
        },
        -- https://github.com/catppuccin/catppuccin/blob/main/docs/style-guide.md
        color_overrides = {
          all = {
            text = '#ffffff',
          },
          mocha = {
            base = '#000000',
            mantle = '#030304',
            crust = '#000000',
          },
        },
      }
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
