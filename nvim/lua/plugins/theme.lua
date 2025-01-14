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
            base = '#000000', -- main bg
            mantle = '#040404', -- sidebar
            crust = '#200902',
            text = '#ffffff',

            -- mauve = '#FBBA77', -- used a lot!! -- orange

            -- rosewater = '#f5e0dc',
            -- flamingo = '#f2cdcd',
            -- pink = '#f5c2e7',
            -- red = '#f38ba8',
            -- maroon = '#eba0ac',
            -- peach = '#fab387',
            -- yellow = '#f9e2af',
            -- green = '#a6e3a1',
            -- teal = '#94e2d5',
            -- sky = '#89dceb',
            -- sapphire = '#74c7ec',
            -- blue = '#89b4fa',
            --
            -- lavender = '#b4befe',
            -- subtext1 = '#bac2de',
            -- subtext0 = '#a6adc8',
            -- overlay2 = '#9399b2',
            -- overlay1 = '#7f849c',
            -- overlay0 = '#6c7086',
            -- surface2 = '#585b70',
            -- surface1 = '#45475a',
            -- surface0 = '#313244',
          },
        },
      }
      vim.cmd.colorscheme 'catppuccin'
    end,
  },
}
