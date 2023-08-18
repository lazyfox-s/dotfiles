local M = {}

local setKey = function(lhs, rhs)
    local map = {
        lhs, '<Plug>(highlightedundo-'..rhs..')', {remap = true}
    }
    return map
end

M.keys = function()
    local keys = {
        setKey('u', 'undo'),
        setKey('<C-r>', 'redo'),
        setKey('U', 'Undo'),
        setKey('g-', 'gminus'),
        setKey('g+', 'gplus')
    }
    return keys
end

M.init = function()
    vim.g['highlightdundo#highlight_duration_delete'] = 300
    vim.g['highlightdundo#highlight_duration_add'] = 300
end

return M
