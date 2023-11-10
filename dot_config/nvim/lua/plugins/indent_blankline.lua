local M = {}

M.config = function ()

require('ibl').setup {
    exclude = { filetypes = {
        'lspinfo',
        'packer',
        'checkhealth',
        'help',
        'man',
        '',
        'dashboard'
    }},
    indent = {
        highlight = 'LineNr'
    },
    scope = {
        show_start = false,
        show_end = false,
        show_exact_scope = true,
        highlight = 'CursorLineNr',
    },
}
end

return M
