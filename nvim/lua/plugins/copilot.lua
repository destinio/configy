return {
  {
    'github/copilot.vim',
    config = function()
      vim.keymap.set('i', '<C-y>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })
      vim.g.copilot_no_tab_map = true

      vim.keymap.set('i', '<C-n>', '<Plug>(copilot-next)')
      vim.keymap.set('i', '<C-p>', '<Plug>(copilot-previous)')
      vim.keymap.set('i', '<C-x>', '<Plug>(copilot-dismiss)')
      vim.keymap.set('i', '<C-.>', '<Plug>(copilot-suggest)')
    end,
  },
}
