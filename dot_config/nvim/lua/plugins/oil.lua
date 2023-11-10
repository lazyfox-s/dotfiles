local M = {}

M.opts = {
    default_file_explorer = true,
    float = {
        win_options = {
            winblend = 0
        }
    },
    view_options = {
        show_hidden = true
    }
}

M.init = function ()
    -- load oil when open directory
    vim.api.nvim_create_augroup('oil_start_if_dir', {})
    vim.api.nvim_create_autocmd('VimEnter', {
        group = 'oil_start_if_dir',
        pattern = '*',
        callback = function ()
            local path = vim.fn.expand('%')
            if vim.fn.isdirectory(path) == 1 then
                require('oil').open(path)
            end
        end
    })
end

return M
