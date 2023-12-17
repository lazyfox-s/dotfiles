local M = {}

M.opts = {
    ui = {
        code_action = ''
    },
    lightbulb = {
        virtual_text = false
    },
    finder = {
        keys = {
            toggle_or_open = 'e'
        }
    }
}

M.init = function ()
    vim.api.nvim_create_autocmd('CursorHold', {
        pattern = '*',
        command = 'Lspsaga show_line_diagnostics ++unfocus'
    })
end

return M
