return {
  {
    'destinio/destinio.nvim',
    -- dir = '~/projects/nvim-plugins/destinio.nvim',
    branch = 'nightly',
    dependencies = {},
    config = function()
      require('destinio').setup()
    end,
  },
}
