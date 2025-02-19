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
        opts = function(_, opts)
          opts.ensure_installed = opts.ensure_installed or {}
          table.insert(opts.ensure_installed, 'js-debug-adapter')
        end,
      }, -- NOTE: Must be loaded before dependants
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'zapling/mason-conform.nvim',
      'hrsh7th/cmp-nvim-lsp',
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
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      local util = require 'lspconfig/util'

      local servers = {
        bashls = {},
        clangd = {
          cmd = { 'clangd', '--background-index' },
          filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
          root_dir = util.root_pattern('compile_commands.json', 'compile_flags.txt', '.git'),
          settings = {
            ccls = {
              completion = {
                filterAndSort = false,
              },
            },
          },
        },
        intelephense = {
          settings = {
            intelephense = {
              format = {
                enable = true,
              },
            },
          },
        },
        checkmake = {},
        cssls = {},
        ts_ls = {
          enabled = false,
        },
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#vtsls
        -- npm install -g @vtsls/language-server
        vtsls = {
          filetypes = {
            'javascript',
            'javascriptreact',
            'javascript.jsx',
            'typescript',
            'typescriptreact',
            'typescript.tsx',
          },
          settings = {
            complete_function_calls = true,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                maxInlayHintLength = 30,
                completion = {
                  enableServerSideFuzzyMatch = true,
                },
              },
            },
            typescript = {
              updateImportsOnFileMove = { enabled = 'always' },
              suggest = {
                completeFunctionCalls = true,
              },
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                parameterNames = { enabled = 'literals' },
                parameterTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                variableTypes = { enabled = false },
              },
            },
          },
        },
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
        shfmt = {},
        tailwindcss = {},
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
