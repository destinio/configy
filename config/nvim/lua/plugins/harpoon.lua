return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    config = function()
      local harpoon = require 'harpoon'
      local notify = require 'notify'

      harpoon:setup()

      vim.keymap.set('n', '<leader>ha', function()
        local file_name = vim.fn.expand '%:t' -- Get the current file name

        harpoon:list():add()

        notify('Adding ' .. file_name .. ' to harpoon', 'info', {
          title = 'Harpoon',
          render = 'compact',
        })
      end, { desc = '[A]dd file to [h]arpoon' })
      vim.keymap.set('n', '<leader>hh', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'Toggle [h]arpoon menu' })
    end,
  },
}
