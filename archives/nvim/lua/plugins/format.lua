-- https://github.com/stevearc/conform.nvim?tab=readme-ov-file#formatters
return {
  {
    "stevearc/conform.nvim",
    opts = {},
    config = function()
      require("conform").setup({
        notify_on_error = false,
        format_on_save = function(bufnr)
          -- Disable "format_on_save lsp_fallback" for languages that don't
          -- have a well standardized coding style. You can add additional
          -- languages here or re-enable it for the disabled ones.
          local disable_filetypes = { c = true, cpp = true }
          local lsp_format_opt
          if disable_filetypes[vim.bo[bufnr].filetype] then
            lsp_format_opt = "never"
          else
            lsp_format_opt = "fallback"
          end
          return {
            lsp_format = lsp_format_opt,
          }
        end,
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "isort", "black" },
          -- javascript = { "prettierd", "prettier", stop_after_first = true },
        },
      })

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function(args)
          require("conform").format({ bufnr = args.buf, async = true, lsp_format = "fallback" })
        end,
      })
    end,
  },
}
