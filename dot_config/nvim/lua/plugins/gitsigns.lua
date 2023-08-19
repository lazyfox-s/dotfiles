local M = {}

M.config = function()

require('gitsigns').setup{
    current_line_blame = true,
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end

        map({'n', 'v'}, 'g<<', ':Gitsigns stage_hunk<CR>')
        map({'n', 'v'}, 'g>>', ':Gitsigns reset_hunk<CR>')
        map('n', 'gS', gs.stage_buffer)
        map('n', 'gR', gs.reset_buffer)
        map('n', 'gd', gs.diffthis)
        map('n', 'gp', gs.preview_hunk)
    end
}

end

return M
