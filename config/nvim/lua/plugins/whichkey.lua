-- https://github.com/folke/which-key.nvim
return {
  { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('which-key').setup {
        preset = 'helix',
        icons = {
          mappings = vim.g.have_nerd_font,
          keys = vim.g.have_nerd_font and {} or {
            Up = '<Up> ',
            Down = '<Down> ',
            Left = '<Left> ',
            Right = '<Right> ',
            C = '<C-…> ',
            M = '<M-…> ',
            D = '<D-…> ',
            S = '<S-…> ',
            CR = '<CR> ',
            Esc = '<Esc> ',
            ScrollWheelDown = '<ScrollWheelDown> ',
            ScrollWheelUp = '<ScrollWheelUp> ',
            NL = '<NL> ',
            BS = '<BS> ',
            Space = '<Space> ',
            Tab = '<Tab> ',
            F1 = '<F1>',
            F2 = '<F2>',
            F3 = '<F3>',
            F4 = '<F4>',
            F5 = '<F5>',
            F6 = '<F6>',
            F7 = '<F7>',
            F8 = '<F8>',
            F9 = '<F9>',
            F10 = '<F10>',
            F11 = '<F11>',
            F12 = '<F12>',
          },
        },

        -- Document existing key chains
        spec = {
          { '<leader>a', group = 'AI' },
          { '<leader>b', group = '[B]uffers Utils' },
          { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
          { '<leader>d', group = '[D]iagnostics' },
          { '<leader>e', group = '[E]vent/Notification' },
          { '<leader>f', group = '[F]ind (Telescope)' },
          { '<leader>g', group = '[G]it Utils', mode = { 'n', 'v' } },
          { '<leader>h', group = '[H]arpoon' },
          { '<leader>n', group = '[N]avigation' },
          { '<leader>r', group = '[R]ename' },
          { '<leader>s', group = '[S]auce' },
          { '<leader>t', group = '[T]oggle' },
          { '<leader>u', group = '[UI] Nvim UI' },
          { '<leader>w', group = '[W]orkspace' },
          { '<leader>x', group = 'Dap - TODD' },
          { '<leader>q', group = '[Q]uick Fix' },
          { '<leader><leader>', group = 'Open Buffers' },
        },
      }
    end,
  },
}
