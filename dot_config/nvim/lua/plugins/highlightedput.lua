local M = {}

local setKeyAll = function(keys)
    local maps = {}
    for idx = 1, #keys do
        local key = keys[idx]
        maps[#maps+1] = {key, '<Plug>(highlightedput-'..key..')', {mode = {'n', 'x'}, remap = true}}
    end
    return maps
end

M.keys = setKeyAll({'p', 'P', 'gp', 'gP', ']p', ']P', ']p', ']P', 'zp', 'zP'})

return M
