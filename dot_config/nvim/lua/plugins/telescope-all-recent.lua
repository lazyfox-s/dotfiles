local M = {}

M.config = function()
require('telescope-all-recent').setup({
    default = {
        disable = true,
        use_cwd = true,
        sorting = 'recent'
    },
    pickers = {
        find_files = {
            disable = false,
            sorting = 'recent'
        }
    }
})
end

return M
