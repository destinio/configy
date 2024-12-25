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
        },
        oldfiles = {
          theme = 'ivy'
        }
      },
      extensions = {
        fzf = {}
      }
    })

    require('telescope').load_extension('fzf')

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'find files' })
    vim.keymap.set('n', '<leader>\\', builtin.find_files, { desc = 'find files' })
    vim.keymap.set('n', '<leader>so', builtin.oldfiles, { desc = 'old files' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'live grep' })
    vim.keymap.set('n', '<leader>sb', builtin.buffers, { desc = 'buffers' })
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'help tags' })

    vim.keymap.set('n', '<leader>en', function()
      require('telescope.builtin').find_files({
        cwd = vim.fn.stdpath('config')
      })
    end, { desc = 'Edit config files' })

    vim.keymap.set('n', '<leader>ep', function()
      require('telescope.builtin').find_files({
        cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
      })
    end, { desc = 'Edit Packages' })
  end
}
