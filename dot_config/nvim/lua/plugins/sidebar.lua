local M = {}

M.keys = {
    {'<C-b>', function() require('sidebar-nvim').toggle() end}
}

M.init = function()
    vim.keymap.set('n', '<C-b>', function() require('sidebar-nvim').toggle() end, {})
end

M.config = function()
    local git = require('sidebar-nvim.builtin.git')
    git.bindings['<<'] = git.bindings['s']
    git.bindings['>>'] = git.bindings['u']
    git.bindings['l'] = git.bindings['e']

    local files = require('sidebar-nvim.builtin.files')
    files.bindings['l'] = files.bindings['e']
    files.bindings['h'] = files.bindings['e']
    files.bindings['N'] = files.bindings['c']

    require('sidebar-nvim').setup({
        sections = {
            'git',
            'diagnostics',
            'files',
            'containers'
        },
        containers = {
            show_all = false
        },
        files = {
            show_hidden = true,
        },
    })

end

return M
