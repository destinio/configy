return {
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'Bilal2453/luvit-meta', lazy = true },
      {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
          library = {
            { path = 'luvit-meta/library', words = { 'vim%.uv' } },
          },
        },
      },
      { 'folke/neodev.nvim', enabled = false },
      {
        'williamboman/mason.nvim',
        config = true,
      }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'saghen/blink.cmp' }, -- cmp support
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
          map('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction', { 'n', 'x' })
          map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          local client = vim.lsp.get_client_by_id(event.data.client_id)

          ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            map('<leader>th', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities())

      local util = require 'lspconfig/util'

      local servers = {
        gopls = {
          filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
          root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
          settings = {
            gopls = {
              completeUnimported = true,
              staticcheck = true,
              usePlaceholders = true,
              -- https://github.com/golang/tools/blob/master/gopls/doc/analyzers.md
              analyses = {
                unusedparams = true,
              },
            },
          },
        },
        pyright = {},
        --    https://github.com/pmizio/typescript-tools.nvim
        -- ts_ls = {},
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      require('mason').setup()

      local ensure_installed = vim.tbl_keys(servers or {})

      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })

      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      ---@diagnostic disable-next-line: missing-fields
      require('mason-lspconfig').setup {
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}

            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})

            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}

--[[ NOTES
-- https://www.youtube.com/watch?v=Q0cvzaPJJas&t=2s
-- lsp https://www.youtube.com/watch?v=bTWWFQZqzyI

-- READ:
-- h vim.lsp
--
-- Config
-- https://github.com/neovim/nvim-lspconfig
-- :help lspconfig-all
--
-- https://github.com/folke/lazydev.nvim - sets up lua dev stuff??
--]]
