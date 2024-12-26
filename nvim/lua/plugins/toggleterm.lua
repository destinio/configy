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

        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<C-q>", [[<C-\><C-n><Cmd>ToggleTerm<Cr>]], opts)
        vim.keymap.set("t", "jj", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)

        vim.keymap.set("n", "<space>tt", "<Cmd>:ToggleTerm direction=float<CR>", opts)
      end,
    },
  },
}
