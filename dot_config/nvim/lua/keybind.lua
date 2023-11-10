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

-- Type q to close buffer in help
vim.api.nvim_create_augroup('help_keymap', {})
vim.api.nvim_create_autocmd('FileType', {
    group = 'help_keymap',
    pattern = 'help',
    callback = function()
        vim.keymap.set('n', 'q', '<cmd>q<CR>', { buffer = true })
        vim.keymap.set('n', '<CR>', '<C-]>', { buffer = true })
        vim.keymap.set('n', '<C-o>', '<C-t>', { buffer = true })
        vim.keymap.set('n', '<C-i>', '<cmd>tag<CR>', { buffer = true })
    end
})

vim.api.nvim_create_augroup('qf_keymap', {})
vim.api.nvim_create_autocmd('FileType', {
    group = 'qf_keymap',
    pattern = 'qf',
    callback = function ()
        vim.keymap.set('n', 'q', '<cmd>q<CR>', { buffer = true })
    end
})

-- buffer
-- vim.keymap.set('n', 'bn', vim.cmd.bnext)
-- vim.keymap.set('n', 'bN', vim.cmd.bprevious)
vim.keymap.set('n', 'bq', vim.cmd.bdelete)
vim.keymap.set('n', 'bb', '<C-^>')
-- vim.keymap.set('n', 'bd', function ()
--     local buf = vim.api.nvim_get_current_buf()
--     vim.cmd.bprevious()
--     vim.api.nvim_buf_delete(buf, {})
-- end)

