local M = {}

M.init = function ()
    vim.g.exchange_no_mappings = true
end

M.keys = {
    {'X', '<Plug>(Exchange)', { mode = {'n', 'x'}, remap = true }},
    {'XX', '<Plug>(ExchangeLine)', { mode = {'n', 'x'}, remap = true }},
}

return M
