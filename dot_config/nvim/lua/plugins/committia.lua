local M = {}

M.init = function()
    vim.g.committia_open_only_vim_starting = true

    vim.api.nvim_create_augroup('committia_init', {})
    vim.api.nvim_create_autocmd('BufReadPre', {
        pattern = 'COMMIT_EDITMSG',
        callback = function()
            vim.o.laststatus = 0
            vim.o.cmdheight = 0
            vim.o.showtabline = 0

            require('lualine').hide()
            vim.api.nvim_set_hl(0, 'Statusline', {link = 'VertSplit'})
            vim.api.nvim_set_hl(0, 'StatuslineNC', {link = 'VertSplit'})
            vim.o.statusline = string.rep('─', vim.api.nvim_win_get_width(0))
        end
    })
end

return M
