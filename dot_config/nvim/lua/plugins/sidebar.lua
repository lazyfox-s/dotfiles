local lazy_require = require('utils').lazy_require
local memos_section = require('plugins.sidebar_memos')
local task_section = require('plugins.sidebar_tasks')

local M = {}

local function git_commit()
    vim.ui.input({
        prompt = 'Commit message'
    },
        function (input)
            if input == nil then
                vim.notify('commit canceled')
                return
            end

            local message = vim.fn.system('git commit -m "'..input..'"')
            vim.cmd.SidebarNvimUpdate()
            vim.notify(message)
        end
    )
end

local function git_commit_amend()
    local message = vim.fn.system('git commit --amend --no-edit')
    vim.cmd.SidebarNvimUpdate()
    vim.notify(message)
end




M.keys = {
    {'<C-b>', lazy_require('sidebar-nvim').toggle}
}

M.init = function()
    vim.keymap.set('n', '<C-b>', lazy_require('sidebar-nvim').toggle, {})
end

M.config = function()
    local git = require('sidebar-nvim.builtin.git')
    git.bindings['<<'] = git.bindings['s']
    git.bindings['>>'] = git.bindings['u']
    git.bindings['l'] = git.bindings['e']
    git.bindings['c'] = git_commit
    git.bindings['a'] = git_commit_amend

    local files = require('sidebar-nvim.builtin.files')
    files.bindings['l'] = files.bindings['e']
    files.bindings['h'] = files.bindings['e']
    files.bindings['N'] = files.bindings['c']

    local diagnostics = require('sidebar-nvim.builtin.files')
    diagnostics.bindings['l'] = diagnostics.bindings['e']

    local todos = require('sidebar-nvim.builtin.todos')
    todos.bindings['l'] = files.bindings['e']

    require('sidebar-nvim').setup({
        sections = {
            'git',
            'diagnostics',
            memos_section,
            task_section,
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
