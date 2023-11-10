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

    local todos = require('sidebar-nvim.builtin.todos')
    todos.bindings['l'] = files.bindings['e']

    require('sidebar-nvim').setup({
        sections = {
            'git',
            'diagnostics',
            'todos',
            'files',
            'containers'
        },
        containers = {
            show_all = false
        },
        files = {
            show_hidden = true,
        },
        todos = {
            initially_closed = false
        }
    })

end

return M
