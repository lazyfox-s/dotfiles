local M = {}

M.config = function()
local themes = require('telescope.themes')
local actions = require('telescope.actions')

require('telescope').setup({
    defaults = vim.tbl_extend(
        'force',
        themes.get_dropdown(),
        {
            winblend = 20,
            mappings = {
                i = {
                    ['<esc>'] = actions.close,
                    ['<C-j>'] = {'<Plug>(skkeleton-toggle)', type = 'command'},
                }
            }
        }
    ),
    pickers = {
        find_files = {
            hidden = true,
        }
    }
})
end

M.keys = function(_)
    local keys = {
        {'<C-p>', '<cmd>Telescope find_files<CR>'},
        {'<C-f>', '<cmd>Telescope live_grep<CR>'}
    }

    return keys
end

return M
