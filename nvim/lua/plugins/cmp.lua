return {
  {
    {
      'saghen/blink.cmp',
      dependencies = 'rafamadriz/friendly-snippets',
      version = '*',
      opts = {
        keymap = { preset = 'default' },

        appearance = {
          use_nvim_cmp_as_default = true,
          nerd_font_variant = 'mono'
        },
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
      },
      config = function()
        require('blink.cmp').setup {
          fuzzy = {
            prebuilt_binaries = {
              force_version = "v0.8.2" -- Replace with the correct version.
            }
          }
        }
      end,
      opts_extend = { "sources.default" }
    }
  }
}
