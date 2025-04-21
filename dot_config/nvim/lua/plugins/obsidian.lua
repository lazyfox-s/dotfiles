local M = {}

local function update_frontmatter(_, note)
    local format = '%Y-%m-%d %H:%M'
    local created = vim.fn.strftime(format)
    local modified = created
    local frontmatter = note:frontmatter()

    if frontmatter.created ~= nil then
        created = frontmatter.created
    end

    local new_frontmatter = {
        created = created,
        modified = modified
    }

    local tags = frontmatter.tags
    if tags ~= nil and #tags >= 1 then
        new_frontmatter.tags = tags
    end

    local aliases = frontmatter.aliases
    if aliases ~= nil and #aliases >= 1 then
        new_frontmatter.aliases = aliases
    end

    note:save_to_buffer({
        frontmatter = new_frontmatter
    })
end


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
    attachments = {
        img_folder = 'assets/imgs'
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
    callbacks = {
        pre_write_note = update_frontmatter
    },
    new_notes_location = 'notes_subdir',
    wiki_link_func = 'use_alias_only',
    ui = { enable = false }
}

M.get_diary_path = function ()
    local client = require('obsidian').get_client()
    return client:daily_note_path().filename
end

M.get_workspace_path = function ()
    local client = require('obsidian').get_client()
    return client.dir.filename
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
