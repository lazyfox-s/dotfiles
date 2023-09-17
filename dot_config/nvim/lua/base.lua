-- Encoding
vim.o.encoding = 'utf-8'
vim.o.fileencoding = 'utf-8'
vim.scriptencoding = 'utf-8'
vim.o.ambiwidth = 'single'


-- Visual
vim.o.number = true
vim.o.relativenumber = true
vim.o.visualbell = true
vim.o.errorbells = false
vim.o.cursorline = true

vim.api.nvim_create_augroup('toggle_relativenumber', {})
vim.api.nvim_create_autocmd('InsertEnter', {
    group = 'toggle_relativenumber',
    pattern = '*',
    callback = function() vim.wo.relativenumber = false end
})
vim.api.nvim_create_autocmd('InsertLeave', {
    group = 'toggle_relativenumber',
    pattern = '*',
    callback = function() vim.wo.relativenumber = true end
})
vim.api.nvim_create_autocmd('BufEnter', {
    group = 'toggle_relativenumber',
    pattern = '*',
    callback = function() vim.wo.relativenumber = true end
})
vim.api.nvim_create_autocmd('BufLeave', {
    group = 'toggle_relativenumber',
    pattern = '*',
    callback = function() vim.wo.relativenumber = false end
})

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

vim.api.nvim_create_augroup('highlight_yank', {})
vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = {'*'},
    callback = function() vim.highlight.on_yank{higroup='DiffChange', timeout=300} end
})

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


-- load ploject locaal setting
vim.api.nvim_create_augroup('vimrc_local', {})
vim.api.nvim_create_autocmd({'BufNewFile', 'BufReadPost'}, {
    group = 'vimrc_local',
    pattern = '*',
    callback = function ()
        local file = vim.fn.findfile('.vimrc_local', '.;')
        if vim.fn.filereadable(file) == 1 then
            vim.cmd.source(file)
        end
    end
})


-- apply dotfiles
vim.api.nvim_create_augroup('dotfiles_apply', {})
vim.api.nvim_create_autocmd('BufWritePost', {
    group = 'dotfiles_apply',
    pattern = vim.fn.expand('~/.local/share/chezmoi/')..'*',
    callback = function() vim.fn.system('chezmoi apply') end
})

