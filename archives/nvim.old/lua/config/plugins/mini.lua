return {
  "echasnovski/mini.nvim",
  config = function()
    local ai = require("mini.ai")
    local jump = require("mini.jump")
    local operators = require("mini.operators")
    local pairs = require("mini.pairs")
    local statusline = require("mini.statusline")

    -- To look into:
    -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-git.md
    -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-move.md

    statusline.setup({
      use_icons = true,
    })

    ai.setup({})
    jump.setup({})
    operators.setup({})
    pairs.setup({})

    -- You can configure sections in the statusline by overriding their
    -- default behavior. For example, here we set the section for
    -- cursor location to LINE:COLUMN
    ---@diagnostic disable-next-line: duplicate-set-field
    statusline.section_location = function()
      return "%2l:%-2v"
    end
  end,
}
