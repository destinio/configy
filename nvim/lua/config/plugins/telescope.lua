return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  config = function()
    require('telescope').setup({
      pickers = {
        find_files = {
          theme = 'ivy'
        },
        buffers = {
          theme = 'ivy'
        }
      },
      extensions = {
        fzf = {}
      }
    })

    require('telescope').load_extension('fzf')

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>\\', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Telescope help tags' })
  end
}
