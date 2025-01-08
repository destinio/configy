-- https://github.com/akinsho/bufferline.nvim?
-- bufferline-configuration
return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("bufferline").setup({
        options = {
          tab_size = 20,
          buffer_close_icon = "",
          modified_icon = "● ",
          close_icon = "",
          left_trunc_marker = "",
          right_trunc_marker = "",
          indicator = {
            style = "underline",
          },
          diagnostics = "nvim_lsp",
          show_buffer_icons = false,
          always_show_bufferline = false,
          -- separator_style = "slant",
          offsets = {
            {
              filetype = "neo-tree",
              separator = true,
              text = "File Explorer",
            },
          },
        },
      })
    end,
  },
}
