local M = {}

M.config = function()
require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
        disable = {}
    },
    indent = {
        enable = true,
        disable = {}
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = false,
            node_incremental = 'v',
            scope_incremental = false,
            node_decremental = '<c-v>',
        },
    },
    rainbow = {
        enable = true,
        extended_mode = true,
        max_file_lines = nil
    }
}
end

return M
