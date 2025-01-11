return {
  {
    dir = '~/projects/nvim-plugins/destinio.nvim', -- 'destinio/destinio.nvim'
    branch = 'nightly',
    dependencies = {},
    config = function()
      require('destinio').setup()
    end,
  },
}
