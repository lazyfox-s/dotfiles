-- Encoding
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.scriptencoding = 'utf-8'
vim.o.ambiwidth = 'single'


-- Visual
vim.o.number = true
vim.o.visualbell = true
vim.o.errorbells = false
vim.o.cursorline = true

--- indent
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

--- floating window
vim.o.pumblend = 0
vim.o.winblend = 0

--- conceal
vim.o.conceallevel = 2
vim.o.concealcursor = ''
vim.g.tex_conceal = 'adgmb'

--- color
vim.o.background = 'dark'
vim.o.termguicolors = true

-- tab line / status line
vim.o.laststatus = 3
vim.o.cmdheight = 2
vim.o.showtabline = 2


-- search
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true


-- manipulation
vim.opt.clipboard:append{'unnamedplus'}
vim.o.timeout = true
vim.o.timeoutlen = 500

vim.o.undofile = true
vim.o.undodir = vim.fn.stdpath('cache')..'/undo'
