return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    dependencies = {
      { 'MunifTanjim/nui.nvim', lazy = true },
    },
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      quickfile = { enabled = true },
      dashboard = {
        enabled = true,
      },
      -- notifier = { enabled = true },
      scope = { enabled = true },
      indent = { enabled = true },
      scroll = { enabled = true },
      zen = { enabled = true },
      styles = {
        notification = {
          wo = { wrap = true }, -- Wrap notifications
        },
        zen = {
          minimal = true,
          backdrop = { transparent = false },
        },
      },
    },
    keys = {
      {
        '<leader>eh',
        function()
          Snacks.notifier.show_history()
        end,
        desc = 'Event History',
      },
      {
        '<leader>en',
        function()
          Snacks.notifier.hide()
        end,
        desc = 'Dismiss All Notifications',
      },
      {
        '<leader>bd',
        function()
          Snacks.bufdelete()
        end,
        desc = 'Delete Buffer',
      },
      {
        '<leader>uz',
        function()
          Snacks.zen.zen()
        end,
        desc = 'Zen Mode',
      },
      {
        '<leader>uZ',
        function()
          Snacks.zen.zoom()
        end,
        desc = 'Zoom',
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
          Snacks.toggle.dim():map '<leader>uD'
        end,
      })
    end,
  },
}
