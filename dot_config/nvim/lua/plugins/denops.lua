local M = {}
M.util = {}

M.util.discover_plugin = function()
    if vim.fn['denops#server#status']() == 'running' then
        vim.fn['denops#plugin#discover']()
    end
end

return M
