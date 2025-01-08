return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
      },
    },
    config = function()
      local builtin = require("telescope.builtin")

      require("telescope").setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules",
            "venv",
          },
        },
        pickers = {
          find_files = {
            theme = "ivy",
          },
          oldfiles = {
            theme = "ivy",
          },
          extensions = {
            --   fzf = {
            --     fuzzy = true,                   -- false will only do exact matching
            --     override_generic_sorter = true, -- override the generic sorter
            --     override_file_sorter = true,    -- override the file sorter
            --   }
            -- }
          },
        },
      })

      -- require('telescope').load_extension('fzf')

      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "help tags" })
      vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "old files" })
    end,
  },
}
