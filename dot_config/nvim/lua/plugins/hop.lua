local M = {}

local hop_keymap_set = function(key, callback)
    local map = {
        key, callback, {mode = '', remap = true}
    }

    return map
end

M.config = function()
    local hop = require('hop')
    hop.setup()
end

M.keys = function(_)
    local hop = function() return require('hop') end
    local directions = function() return require('hop.hint').HintDirection end

    local keys = {
        hop_keymap_set('f', function()
            hop().hint_char1({ direction = directions().AFTER_CURSOR, current_line_only = true })
        end),
        hop_keymap_set('F', function()
            hop().hint_char1({ direction = directions().BEFORE_CURSOR, current_line_only = true })
        end),
        hop_keymap_set('t', function()
            hop().hint_char1({ direction = directions().AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
        end),
        hop_keymap_set('T', function()
            hop().hint_char1({ direction = directions().BEFORE_CURSOR, current_line_only = true, hint_offset = -1 })
        end),
        hop_keymap_set('s', function()
            hop().hint_char2({current_line_only = false, multi_windows = true})
        end),
        hop_keymap_set('<C-j>', function()
            hop().hint_vertical({ direction = directions().AFTER_CURSOR, current_line_only = false})
        end),
        hop_keymap_set('<C-k>', function()
            hop().hint_vertical({ direction = directions().BEFORE_CURSOR, current_line_only = false})
        end)
    }

    return keys
end

return M
