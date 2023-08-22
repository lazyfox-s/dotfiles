local M = {}

M.keys = {'f', 'F', 't', 'T'}

M.init = function()
    vim.g.qs_highlight_on_keys = M.keys
    vim.g.qs_buftype_blacklist = {'terminal', 'nofile', 'TelescopePrompt', 'SideBarNvim'}
    vim.g.qs_filetype_blacklist = {'dashboard'}
end

M.config = function()
    vim.api.nvim_set_hl(0, 'QuickScopePrimary', { fg = 'red', bold = true, nocombine = true })
    vim.api.nvim_set_hl(0, 'QuickScopeSecondary', { fg = 'cyan', bold = true, nocombine = true })
end

return M
