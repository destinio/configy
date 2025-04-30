return {
  'stevearc/aerial.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    require('aerial').setup {
      layout = {
        min_width = 20,
      },
      show_guides = true,
    }

    vim.keymap.set('n', '<leader>bs', '<cmd>AerialToggle!<CR>', {
      desc = '[S]ymbols',
    })
  end,
}
