return {
  {
    "echasnovski/mini.nvim",
    version = false,
    config = function()
      local statusline = require("mini.statusline")

      require("mini.surround").setup()
      require("mini.ai").setup()
      require("mini.comment").setup()
      require("mini.icons").setup()
      require("mini.pairs").setup()
      require("mini.surround").setup()
      -- require('mini.tabline').setup()

      statusline.setup({})

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return "%2l:%-2v"
      end
    end,
  },
}
