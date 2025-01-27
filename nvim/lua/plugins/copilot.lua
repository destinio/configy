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
        },
        -- See Commands section for default commands if you want to lazy load on them
      },
    },
    config = function()
      -- vim.keymap.set('i', '<C-y>', 'copilot#Accept("\\<CR>")', {
      --   expr = true,
      --   replace_keycodes = false,
      -- })

      vim.keymap.set('i', '<C-n>', '<Plug>(copilot-next)')
      vim.keymap.set('i', '<C-p>', '<Plug>(copilot-previous)')
      vim.keymap.set('i', '<C-x>', '<Plug>(copilot-dismiss)')
      vim.keymap.set('i', '<C-.>', '<Plug>(copilot-suggest)')
      vim.keymap.set('i', '<C-f>', '<Plug>(copilot-accept-word)')
    end,
  },
}
