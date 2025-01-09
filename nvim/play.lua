vim.keymap.set("n", "<space>ss", "<Cmd>.lua<Cr>", {})

-- print(math.floor(vim.o.columns * 0.4))
-- print(vim.inspect(vim.api.nvim_list_runtime_paths()))

print(vim.inspect(vim.lsp.status()))

