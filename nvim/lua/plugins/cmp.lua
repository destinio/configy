return {
  {
    {
      -- https://cmp.saghen.dev/configuration/completion.html#completion-menu-draw
      'saghen/blink.cmp',
      dependencies = 'rafamadriz/friendly-snippets',

      version = '*',
      opts = {
        keymap = { preset = 'default' },
        appearance = {
          use_nvim_cmp_as_default = true,
          nerd_font_variant = 'mono',
        },
        completion = {
          list = {
            selection = {
              preselect = true,
              auto_insert = true,
            },
          },
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 500,
          },
          menu = {
            draw = {
              padding = 2,
              gap = 2,
              treesitter = {},
              columns = { { 'label', 'label_description', gap = 1 }, { 'kind_icon' } },
            },
          },
        },
        sources = {
          default = { 'lazydev', 'lsp', 'path', 'snippets', 'buffer' },
          providers = {
            lazydev = {
              name = 'LazyDev',
              module = 'lazydev.integrations.blink',
              score_offset = 100,
            },
          },
        },
      },
      opts_extend = { 'sources.default' },
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
