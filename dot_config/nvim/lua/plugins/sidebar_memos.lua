local to_superscript = require('utils').convert_to_superscript
local right_align = require('utils').right_alignment
local wrap_text = require('utils').wrap_text

local function save_memo(is_task)
    local prompt = 'Memo'
    if is_task then
        prompt = "Task"
    end
    vim.ui.input({
        prompt = prompt
    },
        function (input)
            if input == nil then
                return
            end
            require('plugins.obsidian').save_memo(input, is_task)
            vim.cmd.SidebarNvimUpdate()
        end
    )
end

local function save_task()
    save_memo(true)
end


local memos = {}
-- Inspired by Obsidian Memos
local memos_section = {
    title = 'Memos',
    icon = ' ',
    setup = function(_) end,
    update = function(_)
        local diary_note = require('plugins.obsidian').get_diary_path()
        local note_path = vim.fn.strftime(diary_note)
        if vim.fn.filereadable(note_path) == 0 then return end

        local lines = vim.fn.readfile(note_path)
        memos = {}
        for i = #lines, 1, -1 do
            local line = lines[i]
            if not vim.startswith(line, '- ') or vim.startswith(line, '- [x]') then
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
                local is_task = vim.startswith(v, '- [ ]')
                local memo = string.sub(v, 9)
                local date = vim.fn.strftime('%Y-%m-%d')
                local time = string.sub(v, 3, 7)
                if is_task then
                    memo = '[ ]'..string.sub(v, 12)
                    time = string.sub(v, 7, 11)
                end

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
        n = function() save_memo(false) end,
        t = save_task
    }
}

return memos_section
