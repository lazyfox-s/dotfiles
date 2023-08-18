-- cursor motion
vim.keymap.set({'n', 'v'}, 'j', 'gj')
vim.keymap.set({'n', 'v'}, 'k', 'gk')
vim.keymap.set({'n', 'v'}, '<Down>', 'gj')
vim.keymap.set({'n', 'v'}, '<UP>', 'gk')

vim.keymap.set({'n', 'v'}, '<C-h>', 'g^')
vim.keymap.set({'n', 'v'}, '<C-l>', 'g$')
vim.keymap.set('i', '<C-h>', '<C-o><C-h>', {remap = true})
vim.keymap.set('i', '<C-l>', '<C-o><C-l>', {remap = true})

-- corresponds <C-[>
vim.keymap.set('i', '<C-]>', '<ESC><Right>')

vim.keymap.set({'n', 'v'}, ';', ':')
vim.keymap.set({'n', 'v'}, ':', ';')

-- inspired by C or D
vim.keymap.set('n', 'Y', 'y$')

-- do not overwrite resister by x
vim.keymap.set('n', 'x', '"_x')

-- <SPACE to toggle folding
vim.keymap.set('n', '<SPACE>', 'za')

-- <ESC> to normal mode in terminal
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>')


-- buffer
vim.keymap.set('n', 'bn', vim.cmd.bnext)
vim.keymap.set('n', 'bN', vim.cmd.bbprevious)
vim.keymap.set('n', 'bq', vim.cmd.bdelete)
vim.keymap.set('n', 'bd', function ()
    local buf = vim.api.nvim_get_current_buf()
    vim.cmd.bprevious()
    vim.api.nvim_buf_delete(buf, {})
end)

