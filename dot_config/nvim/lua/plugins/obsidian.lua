local M = {}


M.opt = {
    workspaces = {
        {
            name = 'personal',
            path = '~/Documents/howm'
        }
    },
    notes_subdir = '',
    daily_notes = {
        date_format = '%Y/%m/%Y-%m-%d-000000',
        template = 'DairyNoteTemplate.md'
    },
    disable_frontmatter = true,
    templates = {
        folder = 'template'
    },
    note_id_func = function(title)
        if title ~= nil then
            return 'notes/'..title
        end
        local format = '%Y/%m/%Y-%m-%d-%H%M%S'
        return vim.fn.strftime(format)
    end,
    new_notes_location = 'notes_subdir'
}

M.get_diary_path = function ()
    local client = require('obsidian').get_client()
    return client:daily_note_path().filename
end

M.save_memo = function (memo, is_task)
    if memo == nil then
        return
    end

    local note_path = M.get_diary_path()

    local date = vim.fn.strftime('%Y-%m-%d')
    local time = vim.fn.strftime('%H:%M')
    local title = {
        vim.fn.strftime('# %Y-%m-%d'),
        '['..date..' '..time..']'
    }

    if vim.fn.filereadable(note_path) == 0 then
        vim.fn.mkdir(vim.fn.fnamemodify(note_path, ':p:h'), 'p')
        vim.fn.writefile(title, note_path)
    end

    local head = '- '  -- list
    if is_task then
        head = '- [ ] '  -- task
    end

    if vim.fn.readfile(note_path, 'b', -1)[1] == '' then
        vim.fn.writefile({head..time..' '..memo}, note_path, 'a')
    else
        vim.fn.writefile({'', '- '..time..' '..memo}, note_path, 'a')
    end
end

return M
