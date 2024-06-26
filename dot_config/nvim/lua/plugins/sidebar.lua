local lazy_require = require('utils').lazy_require
local to_superscript = require('utils').convert_to_superscript
local right_align = require('utils').right_alignment
local wrap_text = require('utils').wrap_text

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


local function save_memo()
    vim.ui.input({
        prompt = 'Memo'
    },
        function (input)
            if input == nil then
                return
            end
            require('plugins.howm').save_memo(input)
            vim.cmd.SidebarNvimUpdate()
        end
    )
end


local memos = {}
-- Inspired by Obsidian Memos
local memos_section = {
    title = 'Memos',
    icon = ' ',
    setup = function(_) end,
    update = function(_)
        local diary_note = require('plugins.howm').get_diary_path()
        local note_path = vim.fn.strftime(diary_note)
        if vim.fn.filereadable(note_path) == 0 then return end

        local lines = vim.fn.readfile(note_path)
        memos = {}
        for i = #lines, 1, -1 do
            local line = lines[i]
            if not vim.startswith(line, '- ') then
                goto continue
            end

            table.insert(memos, line)

            if #memos >= 3 then break end

            ::continue::
        end
    end,
    draw = function(_)
        local body = {'Press [n] to create todays note'}
        local width = require('sidebar-nvim').get_width()

        if #memos ~= 0 then
            body = {}
            for _, v in ipairs(memos) do
                local memo = string.sub(v, 9)
                local date = vim.fn.strftime('%Y-%m-%d')
                local time = string.sub(v, 3, 7)
                local timestamp = to_superscript(date..' '..time)
                timestamp = right_align(timestamp, width-3) -- 3: gutter width

                memo = vim.fn.split(memo, '\\%>90v')[1]
                local lines = wrap_text(memo, width-5) -- 5: gutter width + indent

                for _, line in ipairs(lines) do
                    table.insert(body, ' '..line)
                end

                table.insert(body, timestamp)
            end
        end
        return body
    end,
    bindings = {
        n = save_memo
    }
}

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
