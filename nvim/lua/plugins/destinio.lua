return {
  {
    'destinio/destinio.nvim',
    branch = 'nightly',
    config = function()
      local destinio = require 'destinio'

      destinio.setup()

      vim.keymap.set('n', '<space>..', function()
        require('destinio').nightly()
      end, {})
    end,
  },
}
