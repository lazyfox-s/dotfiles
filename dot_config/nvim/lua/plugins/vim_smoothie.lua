local M = {}

M.keys = {'<C-D>', '<C-U>', '<S-Down>', '<PageDown>', '<S-Up>', '<PageUp>', 'gg', 'G'}

M.init = function()
vim.g.smoothie_enables = true
vim.g.smoothie_experimental_mappings = true
vim.g.smoothie_remapped_commands = M.keys
end

return M
