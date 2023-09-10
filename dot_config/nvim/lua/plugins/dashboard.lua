local set_ansi_color = function()
    vim.cmd([[syntax region AnsiColorBlack matchgroup=Text start="\\e\[30m" end="\\e\[\d\d\?m" containedin=DashboardHeader concealends]])
    vim.cmd([[syntax region AnsiColorRed matchgroup=Text start="\\e\[31m" end="\\e\[\d\d\?m" containedin=DashboardHeader concealends]])
    vim.cmd([[syntax region AnsiColorGreen matchgroup=Text start="\\e\[32m" end="\\e\[\d\d\?m" containedin=DashboardHeader concealends]])
    vim.cmd([[syntax region AnsiColorYellow matchgroup=Text start="\\e\[33m" end="\\e\[\d\d\?m" containedin=DashboardHeader concealends]])
    vim.cmd([[syntax region AnsiColorBlue matchgroup=Text start="\\e\[34m" end="\\e\[\d\d\?m" containedin=DashboardHeader concealends]])
    vim.cmd([[syntax region AnsiColorMagenta matchgroup=Text start="\\e\[35m" end="\\e\[\d\d\?m" containedin=DashboardHeader concealends]])
    vim.cmd([[syntax region AnsiColorCyan matchgroup=Text start="\\e\[36m" end="\\e\[\d\d\?m" containedin=DashboardHeader concealends]])
    vim.cmd([[syntax region AnsiColorWhite matchgroup=Text start="\\e\[37m" end="\\e\[\d\d\?m" containedin=DashboardHeader concealends]])
    vim.cmd([[highlight AnsiColorBlack ctermfg=Black guifg=Black]])
    vim.cmd([[highlight AnsiColorRed ctermfg=Red guifg=Red]])
    vim.cmd([[highlight AnsiColorGreen ctermfg=Green guifg=Green]])
    vim.cmd([[highlight AnsiColorYellow ctermfg=Yellow guifg=Yellow]])
    vim.cmd([[highlight AnsiColorBlue ctermfg=Blue guifg=Blue]])
    vim.cmd([[highlight AnsiColorMagenta ctermfg=Magenta guifg=Magenta]])
    vim.cmd([[highlight AnsiColorCyan ctermfg=Cyan guifg=Cyan]])
    vim.cmd([[highlight AnsiColorWhite ctermfg=White guifg=White]])
end

local config = function()

local db = require('dashboard')
local home = os.getenv('HOME')
local ascii_file = home..'/.config/nvim/splash.txt'
local update_text = ''

if (require('lazy.status').has_updates()) then
    update_text = 'Some plugins has updates.'
end

db.setup {
    theme = 'doom',
    config = {
        header = vim.fn.readfile(ascii_file),
        center = {
            {icon = '  ',
            desc = 'Most Recently Used                      ',
            key = 'r',
            action = 'Telescope oldfiles'},
            {icon = '  ',
            desc = 'Memo Search                             ',
            action =  'call qfixmemo#Grep()',
            key = 'm'},
            {icon = '  ',
            desc = 'New Entry                               ',
            action = 'enew',
            key = 'e'},
            {icon = '  ',
            desc ='File Browser                            ',
            action =  'Fern .',
            key = 'f'},
            {icon = '  ',
            desc = 'Find  word                              ',
            action = 'Telescope live_grep',
            key = 'g'},
            {icon = '  ',
            desc = 'Restore Session                         ',
            action = 'SessionRestore',
            key = 's'},
            {icon = '  ',
            desc = 'Open Personal dotfiles                  ',
            action = 'Telescope find_files prompt_title=dotfiles cwd=$HOME/.local/share/chezmoi',
            key = 'd'},
        },
        footer = {update_text},
    },
    hide = {
        statusline,
        tabline
    },
    preview = {
        command,
        file_path,
        file_height,
        file_width
    }
}

vim.api.nvim_create_augroup('dashboard_init', {})
vim.api.nvim_create_autocmd('FileType', {
    pattern = 'dashboard',
    group = 'dashboard_init',
    callback = set_ansi_color
})


end

return config
