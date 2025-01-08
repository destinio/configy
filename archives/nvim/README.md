- https://www.youtube.com/watch?v=Q0cvzaPJJas

## Notes

## Apis
- api-global
- api-vimscript - VimScript Fuctions
- api-command - Command Functions

- Buffers
  - api-buffer
  - nvim_get_current_buf
  - nvim_set_current_buf
  - nvim_buf_is_valid
  - nvim_buf_line_count
  - nvim_buf_set_lines
  - nvim_buf_set_name

- Lines
  - nvim_get_current_line

- Tabs
  - nvim_get_current_tabpage
  - nvim_list_tabpages

- Window
  - nvim_get_current_win
  - nvim_list_wins

- Terminal
  - nvim_open_term

- Key Maps
  - nvim_set_keymap -- use vim.keymap
  - vim.keymap.set("n", "<space>ff", ":lua print(124)<CR>", { silent = true })
  - vim.api.nvim_del_keymap("n", "<space>ff")

- Messages / Notify
  - *highlight-groups* - for colored output
  - vim.api.nvim_echo({ { "Test", "test2" } }, false, {})
  - vim.api.nvim_echo({
  -   { "Error: ", "ErrorMsg" },
  -   { "File not found.", "WarningMsg" },
  - }, false, {})
  - nvim_notify

- Run time paths
  - nvim_list_runtime_paths

- Command Functions
  - nvim_buf_create_user_command
  - nvim_create_user_command
  - nvim_get_commands

## Languages
**lsp, format, lint**

### python
https://github.com/psf/black - format/lint
https://pycqa.github.io/isort/ - format

### lua
https://github.com/JohnnyMorganz/StyLua?tab=readme-ov-file#installation

### html/css
-- `npm install -g @tailwindcss/language-server`
-- https://github.com/tailwindlabs/tailwindcss-intellisense/tree/HEAD/packages/tailwindcss-language-server

### Defintions
# Basic lookup (shows all meanings)
`wn word -over`

# Look up just nouns
`wn word -n`

# Look up just verbs
`wn word -v`

# Look up adjectives
`wn word -a`

# Look up adverbs
`wn word -r`

# Show synonyms (similar words)
`wn word -syns`

# Show antonyms (opposite words)
`wn word -ants`
