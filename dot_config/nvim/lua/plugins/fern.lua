local M = {}

local fern_action = function(key, action)
    vim.keymap.set('n', key, '<Plug>(fern-action-'..action..')', {remap = true, buffer = true})
end

local init_fern = function()
    fern_action('v', 'open:side')
    fern_action('K', 'new-dir')
    fern_action('N', 'new-file')
    fern_action('.', 'hidden:toggle')
    fern_action('<Space>', 'mark:toggle')
    fern_action('C', 'clipboard-copy')
    fern_action('M', 'clipboard-move')
    fern_action('P', 'clipboard-paste')
    fern_action('D', 'trash')
    fern_action('c', 'copy')
    fern_action('m', 'move')
    fern_action('y', 'yank')
    fern_action('d', 'remove')
    fern_action('h', 'collapse')
    fern_action('l', 'open-or-expand')
    fern_action('H', 'leave')
    fern_action('L', 'open-or-enter')
    fern_action('<CR>', 'open-or-enter')
    fern_action('s', 'open:select')
    fern_action('t', 'open:tabedit')
    fern_action('<C-l>', 'reload')
    fern_action('r', 'rename')
    fern_action('i', 'reveal')
    fern_action('gr', 'grep')
    fern_action('cd', 'tcd')
    vim.keymap.set('n', 'q', '<cmd>q<CR>')
end

M.init = function()
    vim.g['fern#renderer'] = 'nerdfont'
    vim.g['fern_git_status#disable_ignored'] = false
    vim.g['fern_git_status#disable_untracked'] = false
    vim.g['fern_git_status#disable_submodules'] = true
    vim.g['fern#disable_default_mappings'] = true

    vim.api.nvim_create_augroup('fern_init', {})
    vim.api.nvim_create_autocmd('FileType', {
        group = 'fern_init',
        pattern = 'fern',
        callback = init_fern
    })
end

M.keys = {
    {'<Leader>ft', '<cmd>Fern . -reveal=% -drawer -toggle -width=40<CR>'},
    {'<Leader>fe', '<cmd>Fern . -reveal=%<CR>'}
}

return M
