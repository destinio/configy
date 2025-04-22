return {
  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      {
        -- https://github.com/L3MON4D3/LuaSnip
        'L3MON4D3/LuaSnip',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        },
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = function()
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        completion = { completeopt = 'menu,menuone,noinsert' },
        -- https://github.com/hrsh7th/nvim-cmp/wiki/Menu-Appearance
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          --  https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-y>'] = cmp.mapping.confirm { select = true },
          -- Manually trigger a completion from nvim-cmp.
          ['<C-Space>'] = cmp.mapping.complete {},
        },
        -- sources are the completion sources see:
        sources = {
          {
            name = 'lazydev',
            -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
            group_index = 0,
          },
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'path' },
        },
      }

      -- END of cmp setup
      -- snippets
      -- TODO: move to snippets.lua
      local s = luasnip.snippet
      local i = luasnip.insert_node
      local t = luasnip.text_node
      local f = luasnip.function_node

      local snippets = {
        s('cl', {
          t 'console.log(',
          i(1),
          t ')',
        }),
        -- insert file name without extension inline
        -- for a function like function <filename>() {}
        s('ff', {
          t 'function ',
          f(function()
            return vim.fn.expand '%:t:r'
          end),
          t '() {',
          i(1),
          t '}',
        }),
      }

      luasnip.add_snippets('typescript', snippets)
      luasnip.add_snippets('typescriptreact', snippets)
      luasnip.add_snippets('javascript', snippets)
      luasnip.add_snippets('javascriptreact', snippets)
    end,
  },
}
