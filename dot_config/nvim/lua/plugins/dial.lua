
local M = {}

local function manipulate(direction, mode)
    return function()
        require('dial.map').manipulate(direction, mode)
    end
end

local keyset = vim.keymap.set

M.init = function ()
    keyset('n', '<C-a>', manipulate('increment', 'normal'))
    keyset('n', '<C-x>', manipulate('decrement', 'normal'))
    keyset('n', 'g<C-a>', manipulate('increment', 'gnormal'))
    keyset('n', 'g<C-x>', manipulate('decrement', 'gnormal'))
    keyset('v', '<C-a>', manipulate('increment', 'visual'))
    keyset('v', 'g<C-a>', manipulate('increment', 'gvisual'))
    keyset('v', '<C-x>', manipulate('decrement', 'visual'))
    keyset('v', 'g<C-x>', manipulate('decrement', 'gvisual'))
end

return M
