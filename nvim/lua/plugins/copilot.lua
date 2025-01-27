return {
  {
    'github/copilot.vim',
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
