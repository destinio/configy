-- https://github.com/leiserfg/blink.cmp/blob/5d81ce341449ea3ae5f5f584ae458c08eb36c8bf/README.md
return {
  {
    {
      -- https://cmp.saghen.dev/configuration/completion.html#completion-menu-draw
      'saghen/blink.cmp',
      version = '*',
      opts_extend = {
        'sources.completion.enabled_providers',
        'sources.compat',
        'sources.default',
      },
      dependencies = {
        'rafamadriz/friendly-snippets',
        -- add blink.compat to dependencies
        {
          'saghen/blink.compat',
          optional = true, -- make optional so it's only enabled if any extras need it
          opts = {},
          version = '*',
        },
      },
      opts = {
        appearance = {
          nerd_font_variant = 'mono',
        },
        completion = {
          accept = {
            -- experimental auto-brackets support
            auto_brackets = {
              enabled = true,
            },
          },
          list = {
            selection = {
              preselect = false,
              auto_insert = true,
            },
          },
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
          },
          menu = {
            draw = {
              treesitter = { 'lsp' },
              padding = 4,
              gap = 8,
              columns = { { 'label', 'label_description', gap = 2 }, { 'kind_icon' } },
            },
          },
        },
        sources = {
          default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
          cmdline = {},
          providers = {
            lazydev = {
              name = 'LazyDev',
              module = 'lazydev.integrations.blink',
              score_offset = 100,
            },
          },
        },
        keymap = {
          preset = 'enter',
          ['<C-y>'] = { 'accept', 'fallback' },
          ['<Cr>'] = { 'accept', 'fallback' },
          ['<C-l>'] = { 'snippet_forward', 'fallback' },
        },
        -- keymap = { preset = 'default' },
      },
    },
  },
}

--[[ keymaps

['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
['<C-e>'] = { 'hide' },
['<C-y>'] = { 'select_and_accept' },

['<C-p>'] = { 'select_prev', 'fallback' },
['<C-n>'] = { 'select_next', 'fallback' },

['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

['<Tab>'] = { 'snippet_forward', 'fallback' },
['<S-Tab>'] = { 'snippet_backward', 'fallback' },

--]]
--
