local M = {}

local function set_map(key, motion)
    return { key, '<Plug>(edgemotion-'..motion..')', { mode = '', remap = true } }
end

M.keys = {
    set_map('<C-j>', 'j'),
    set_map('<C-k>', 'k')
}

return M
