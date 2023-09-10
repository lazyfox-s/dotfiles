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
    vim.g.QFixHowm_SplitMode = 1
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

    vim.g.QFixHowm_Wiki = 1
    vim.g.QFixHowm_WikiDir = 'notes'
     vim.g.QFixMRU_Filename = '~/.qfixmru'
    vim.g.QFixMRU_RegisterFile = '~/Documents/howm'
end

return M
