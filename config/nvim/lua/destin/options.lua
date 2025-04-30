vim.opt.number = true -- show line numbers
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.mouse = 'a' -- enable mouse support
vim.opt.showmode = false -- controlled by status line
vim.opt.wrap = false -- disable line wrapping
vim.opt.breakindent = true -- enable break indent
vim.opt.undofile = true -- enable persistent undo
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.smartcase = true -- override ignorecase if search pattern contains uppercase letters
vim.opt.signcolumn = 'yes' -- always show sign column
vim.opt.updatetime = 250 -- faster completion
vim.opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete
vim.opt.splitright = true -- open vertical splits to the right
vim.opt.splitbelow = true -- open horizontal splits below
vim.opt.list = true -- show whitespace characters
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- define whitespace characters
vim.opt.inccommand = 'split' -- show live substitutions
vim.opt.cursorline = true -- highlight the current line
vim.opt.scrolloff = 10 -- keep 10 lines above and below the cursor

-- lines
vim.opt.cmdheight = 0 -- no command line height - cmd line comes back when needed
vim.opt.laststatus = 3 -- global status line

-- Netrw settings
vim.g.netrw_banner = 0 -- disable netrw banner
vim.g.netrw_liststyle = 3 -- tree view
