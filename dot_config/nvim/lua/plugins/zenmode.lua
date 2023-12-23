local M = {}

M.opts = {
    window = {
        options = {
            signcolumn = 'no',
            cursorline = false,
        }
    },
    plugins = {
        options = {
            enabled = true,
            ruler = false,
            showcmd = false,
            laststatus = 0
        },
        twilight = { enabled = true },
        gitsigns = { enabled = false }
    }
}

return M
