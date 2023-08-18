local init = function()
    local setKey = function(lhs, rhs)
        vim.keymap.set('n', lhs, '<Plug>(highlightedundo-'..rhs..')', {remap = true})
    end

    setKey('u', 'undo')
    setKey('<C-r>', 'redo')
    setKey('U', 'Undo')
    setKey('g-', 'gminus')
    setKey('g+', 'gplus')

    vim.api.nvim_set_var('highlightdundo#highlight_duration_delete', 300)
    vim.api.nvim_set_var('highlightdundo#highlight_duration_add ', 300)
end

return init
