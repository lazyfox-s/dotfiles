local M = {}

M.config = function ()
vim.cmd [[highlight default link IndentBlanklineChar LineNr]]
vim.cmd [[highlight default link IndentBlanklineContextChar CursorLineNr]]
vim.g.indent_blankline_filetype_exclude = {
    'lspinfo',
    'packer',
    'checkhealth',
    'help',
    'man',
    '',
    'dashboard'
}

require('indent_blankline').setup {
    show_current_context = true,
    show_current_context_start = false,
}
end

return M
