return {
  {
    -- amongst your other plugins
    {
      "akinsho/toggleterm.nvim",
      version = "*",
      config = function()
        require("toggleterm").setup({})

        vim.api.nvim_create_autocmd("TermOpen", {
          pattern = "*",
          callback = function()
            local buf = vim.fn.bufnr()

            _G.term_buf = buf

            vim.keymap.set("n", "<C-q>", function()
              if vim.fn.bufnr() == _G.term_buf then
                vim.cmd("ToggleTerm")
              end
            end, { buffer = buf, silent = true })
          end,
        })
        local opts = { silent = true }

        vim.keymap.set("t", "<esc>", "<C-\\><C-n>", opts)
        -- vim.keymap.set("t", "<esc><esc>", "<Cmd>ToggleTerm<Cr>", opts)
        vim.keymap.set("t", "<C-q>", "<C-\\><C-n><Cmd>ToggleTerm<Cr>", opts)
        vim.keymap.set("t", "jj", "<C-\\><C-n>", opts)
        vim.keymap.set("t", "kk", "<C-\\><C-n>", opts)

        vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
        vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
        vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
        vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)

        -- KeymacopeFuzzyCommandSearch) for opening terminal on the right side
        vim.keymap.set("n", "<space>tl", "<Cmd>:ToggleTerm direction=vertical size=80<CR>", opts)
        -- Keymap for opening terminal in a floating window
        vim.keymap.set("n", "<space>tf", "<Cmd>:ToggleTerm direction=float<CR>", opts)
        vim.keymap.set("n", "<space>,", "<Cmd>:ToggleTerm direction=float<CR>", opts)
        -- Keymap for opening terminal at the bottom
        vim.keymap.set("n", "<space>tj", "<Cmd>:ToggleTerm direction=horizontal size=15<CR>", opts)
        -- Keymap for opening terminal at the bottom
        vim.keymap.set("n", "<space>tt", "<Cmd>:ToggleTerm direction=tab<CR>", opts)
      end,
    },
  },
}
