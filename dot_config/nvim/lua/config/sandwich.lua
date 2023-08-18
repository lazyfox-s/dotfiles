local M = {}

M.init = function()
    vim.g.sandwich_no_default_key_mappings = 1
    vim.g.operator_sandwich_no_default_key_mappings = 1
    vim.g.textobj_sandwich_no_default_key_mappings = 1
end

M.config = function()
    vim.cmd.runtime('macros/sandwich/keymap/surround.vim')
end

return M
