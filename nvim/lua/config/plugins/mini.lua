return {
  'echasnovski/mini.nvim',
  config = function()
    local ai = require('mini.ai')
    local clue = require('mini.clue')
    local jump = require('mini.jump')
    local operators = require('mini.operators')
    local pairs = require('mini.pairs')
    local statusline = require('mini.statusline')

    -- To look into:
    -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-git.md
    -- https://github.com/echasnovski/mini.nvim/blob/main/readmes/mini-move.md

    statusline.setup({
      use_icons = true
    })

    ai.setup({})
    clue.setup({
      triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<space>' },
        { mode = 'x', keys = '<space>' },

        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },
      },

      clues = {
        -- Enhance this by adding descriptions for <Leader> mapping groups
        clue.gen_clues.builtin_completion(),
        -- clue.gen_clues.g(),
        clue.gen_clues.marks(),
        clue.gen_clues.registers(),
        clue.gen_clues.windows(),
        clue.gen_clues.z(),
        { mode = "n", keys = "<space>s", desc = "Search" },
        { mode = "n", keys = "<space>p", desc = "Ex" },
        { mode = "n", keys = "<space>e", desc = "Edit" },
        { mode = "n", keys = "<space>x", desc = "Lua run line" },
        { mode = "n", keys = "]",        desc = "Next" },
        { mode = "n", keys = "[",        desc = "Prev" },
        { mode = "n", keys = "g",        desc = "Go to" },
        -- { mode = "n", keys = "`",        desc = "Marks" },
        -- { mode = "n", keys = "m",        desc = "Mark" },
        { mode = "n", keys = "d",        desc = "Delete" },
        { mode = "n", keys = "c",        desc = "Change" },
      },
    })
    jump.setup({})
    operators.setup({})
    pairs.setup({})
  end
}
