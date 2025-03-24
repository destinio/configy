return {
  {
    'github/copilot.vim',
    dependencies = {
      {
        'CopilotC-Nvim/CopilotChat.nvim',
        dependencies = {},
        build = 'make tiktoken', -- Only on MacOS or Linux
        opts = {
          -- See Configuration section for options
          enabled = false,
        },
        -- See Commands section for default commands if you want to lazy load on them
      },
    },
    config = function()
      -- vim.keymap.set('i', '<C-y>', 'copilot#Accept("\\<CR>")', {
      --   expr = true,
      --   replace_keycodes = false,
      -- })

      local notify = require 'notify'

      vim.keymap.set('i', '<C-n>', '<Plug>(copilot-next)')
      vim.keymap.set('i', '<C-p>', '<Plug>(copilot-previous)')
      vim.keymap.set('i', '<C-x>', '<Plug>(copilot-dismiss)')
      vim.keymap.set('i', '<C-.>', '<Plug>(copilot-suggest)')
      vim.keymap.set('i', '<C-f>', '<Plug>(copilot-accept-word)')

      vim.keymap.set('n', '<leader>cd', function()
        vim.cmd 'Copilot disable'
        -- print 'Copilot disabled'
        notify('Copilot disabled', 'info', {
          title = 'Copilot',
          timeout = 1000,
          render = 'compact',
        })
      end, { desc = '[D]isable Copilot' })

      vim.keymap.set('n', '<leader>ce', function()
        vim.cmd 'Copilot enable'
        notify('Copilot enable', 'info', {
          title = 'Copilot',
          timeout = 1000,
          render = 'compact',
        })
        -- print 'Copilot enabled'
      end, { desc = '[E]nable Copilot ' })
    end,
  },
}
