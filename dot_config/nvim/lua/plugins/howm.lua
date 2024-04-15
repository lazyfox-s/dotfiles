local M = {}

M.init = function()
    vim.g.QFixHowm_Key = 'g'
    vim.g.QFixHowm_FileType = ''
    vim.g.howm_fileencoding = 'utf-8'
    vim.g.howm_fileformat = 'unix'
    vim.g.QFixHowm_Title = '#'
    vim.g.QFixMRU_Title = {
        md = '^# '
    }
    vim.g.QFixHowm_SplitMode = 0
    vim.g.QFix_CloseOnJump = 1
    vim.g.QFix_PreviewEnable = 1
    vim.g.QFixHowm_MenuCalendar = 1
    vim.g.QFixHowm_CalendarWinCmd = 'vertical botright'
    vim.g.QFixHowm_FoldingMode = 1
    vim.g.qfixmemo_markdown_emphasis = 1
    vim.g.disable_QFixWin = 1

    vim.g.howm_dir = '~/Documents/howm'
    vim.g.QFixHowm_RootDir = '~/Documents/howm'
    vim.g.QFixHowm_HolidayFile = '~/Documents/howm/Sche-Hd-0000-00-00-000000.utf8'
    vim.g.QFixHowm_RecentDays = 30

    vim.g.QFixHowm_DiaryFile = '%Y/%m/%Y-%m-%d-000000.md'
    vim.g.howm_filename = '%Y/%m/%Y-%m-%d-%H%M%S.md'
    vim.g.QFixHowm_Wiki = 1
    vim.g.QFixHowm_WikiDir = 'notes'
     vim.g.QFixMRU_Filename = '~/.qfixmru'
    vim.g.QFixMRU_RegisterFile = '~/Documents/howm'
end

M.get_diary_path = function ()
    local note_path = vim.g.QFixHowm_RootDir..'/'..vim.g.QFixHowm_DiaryFile
    note_path = vim.fn.expand(note_path)
    note_path = vim.fn.strftime(note_path)

    return note_path
end

M.save_memo = function (memo)
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

    if vim.fn.readfile(note_path, 'b', -1)[1] == '' then
        vim.fn.writefile({'- '..time..' '..memo}, note_path, 'a')
    else
        vim.fn.writefile({'', '- '..time..' '..memo}, note_path, 'a')
    end
end

return M
