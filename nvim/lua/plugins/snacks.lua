return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    dependencies = {
      { 'MunifTanjim/nui.nvim', lazy = true },
      {
        'j-hui/fidget.nvim',
        opts = {
          -- options
        },
      },
    },
    lazy = false,
    ---@type snacks.Config
    ---@module 'snacks'
    opts = {
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      dashboard = {
        enabled = true,
        -- sections = {
        --   { section = 'header' },
        --   { section = 'keys', gap = 1, padding = 1 },
        --   { section = 'startup' },
        --   {
        --     section = 'terminal',
        --     cmd = 'pokemon-colorscripts -n rayquaza --no-title; sleep .1',
        --     random = 10,
        --     pane = 2,
        --     indent = 4,
        --     height = 30,
        --   },
        -- },
      },
      notifier = {
        -- your notifier configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      },
      scope = { enabled = true },
      indent = { enabled = true },
      -- input = { enabled = true },
      -- notifier = {
      --   enabled = true,
      --   timeout = 3000,
      -- },
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      -- words = { enabled = true },
      styles = {
        notification = {
          -- wo = { wrap = true } -- Wrap notifications
        },
      },
    },
    keys = {
      {
        '<leader>n',
        function()
          Snacks.notifier.show_history()
        end,
        desc = 'Notification History',
      },
      {
        '<leader>un',
        function()
          Snacks.notifier.hide()
        end,
        desc = 'Dismiss All Notifications',
      },
      {
        '<leader>z',
        function()
          Snacks.zen()
        end,
        desc = 'Toggle Zen Mode',
      },
      {
        '<leader>bd',
        function()
          Snacks.bufdelete()
        end,
        desc = 'Delete Buffer',
      },
      {
        '<leader>Z',
        function()
          Snacks.zen.zoom()
        end,
        desc = 'Toggle Zoom',
      },
      {
        '<leader>gB',
        function()
          Snacks.gitbrowse()
        end,
        desc = 'Git Browse',
        mode = { 'n', 'v' },
      },
      {
        '<leader>gb',
        function()
          Snacks.git.blame_line()
        end,
        desc = 'Git Blame Line',
      },
    },
    init = function()
      vim.api.nvim_create_autocmd('User', {
        pattern = 'VeryLazy',
        callback = function()
          -- Create some toggle mappings
          Snacks.toggle.dim():map '<leader>uD'
        end,
      })
    end,
  },
}
