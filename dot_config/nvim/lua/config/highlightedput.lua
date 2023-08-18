local init = function()
    local setKeyAll = function(keys)
        for idx = 1, #keys do
            local key = keys[idx]
            vim.keymap.set({'n', 'x'}, key, '<Plug>(highlightedput-'..key..')', {remap = true})
        end
    end

    setKeyAll({'p', 'P', 'gp', 'gP', ']p', ']P', ']p', ']P', 'zp', 'zP'})

end

return init
