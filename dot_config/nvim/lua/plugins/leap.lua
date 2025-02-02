local M = {}

local function set_map(key, callback)
    local map = {
        key, callback, { mode = '', remap = true }
    }
    return map
end

M.keys = function()
    local keys = {
        set_map('s', function()
            require('leap').leap { target_windows = vim.tbl_filter(
                function(win)  return vim.api.nvim_win_get_config(win).focusable end,
                vim.api.nvim_tabpage_list_wins(0)
            )}
        end)
    }

    return keys
end

M.config = function()
    vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
    vim.api.nvim_set_hl(0, 'LeapMatch', {
    fg = 'white', bold = true, nocombine = true,
    })

    vim.api.nvim_set_hl(0, 'LeapLabelPrimary', {
    fg = 'red', bold = true, nocombine = true,
    })
    vim.api.nvim_set_hl(0, 'LeapLabelSecondary', {
    fg = 'cyan', bold = true, nocombine = true,
    })
    vim.api.nvim_set_hl(0, 'LeapLabel', {
        link = 'LeapLabelPrimary'
    })
    require('leap').opts.highlight_unlabeled_phase_one_targets = true
end

return M
