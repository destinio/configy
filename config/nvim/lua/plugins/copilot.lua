return {
  {
    'github/copilot.vim',
    dependencies = {
      {
        'CopilotC-Nvim/CopilotChat.nvim',
        dependencies = {},
        build = 'make tiktoken', -- Only on MacOS or Linux
        opts = {
          enabled = false,
        },
      },
    },
    config = function()
      local notify = require 'notify'

      vim.keymap.set('i', '<C-n>', '<Plug>(copilot-next)')
      vim.keymap.set('i', '<C-p>', '<Plug>(copilot-previous)')
      vim.keymap.set('i', '<C-x>', '<Plug>(copilot-dismiss)')
      vim.keymap.set('i', '<C-.>', '<Plug>(copilot-suggest)')
      vim.keymap.set('i', '<C-f>', '<Plug>(copilot-accept-word)')

      local opts = {
        title = 'Copilot',
        timeout = 1000,
        render = 'compact',
      }

      vim.keymap.set('n', '<leader>cd', function()
        vim.cmd 'Copilot disable'
        notify('Copilot disabled', 'info', opts)
      end, { desc = '[D]isable Copilot' })

      vim.keymap.set('n', '<leader>ce', function()
        vim.cmd 'Copilot enable'
        notify('Copilot enable', 'info', opts)
      end, { desc = '[E]nable Copilot ' })
    end,
  },
}
