return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      local themes = require 'telescope.themes'
      local defaults = vim.tbl_deep_extend('force', themes.get_ivy(), {
        -- Ignore certain directories when searching
        file_ignore_patterns = { 'node_modules', 'vendor' },
      })

      require('telescope').setup {
        defaults = defaults,
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'

      -- See `:help telescope.builtin` -- The following list all the built-in functions
      vim.keymap.set('n', '<leader>fs', builtin.builtin, { desc = '[S]elect Telescope' })

      vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[B]uffers' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = '[B]uffers' })
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[D]iagnostics' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = '[G]rep' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = '[H]elp' })
      vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = '[K]eymaps' })
      vim.keymap.set('n', '<leader>fo', builtin.oldfiles, { desc = 'Recent Files' })
      vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = '[R]esume' })
      vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = 'Current [W]ord' })
      vim.keymap.set('n', '<leader>p', builtin.find_files, { desc = 'Files' })

      vim.keymap.set('n', '<leader>f/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[/] in Open Files' })

      -- Shortcut for searching your Neovim configuration files
      vim.keymap.set('n', '<leader>fn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[N]eovim files' })
    end,
  },
}
