local config = function()

local nightfox_conf = require("nightfox.config")
nightfox_conf.options.transparent = false

local function getFileTime()
    local file = vim.fn.expand('%')
    local time = vim.fn.getftime(file)

    if time == -1 then
        return ''
    end

    return vim.fn.strftime('%y-%m-%d %H:%M', time)
end

local function getSkkMode()
    if vim.fn['skkeleton#is_enabled']() then
        local mode = vim.fn['skkeleton#mode']()
        if mode == 'hira' then
            return 'skk:[あ]'
        elseif mode == 'kata' then
            return 'skk:[カ]'
        elseif mode == 'hankata' then
            return 'skk:[_ｶ]'
        end
    end
    return ''
end

require('lualine').setup({
    options = {
        theme = 'carbonfox',
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' }
    },
    sections = {
        lualine_a = { 'mode', getSkkMode },
        lualine_b = {
            {
                'filename',
                path = 1
            },
        },
        lualine_c = { 'branch', 'diff', {
            'diagnostics',
            always_visible=false,
            symbols = {error=' ', warn=' ', info=' ', hint=' '}} },
        lualine_x = { 'progress' },
        lualine_y = { 
            {'encoding', icon=''},
            {
                'fileformat',
                symbols = {
                    unix = ' unix',
                    dos = ' dos',
                    mac = ' mac',
                }
            },
            'filetype',
            { getFileTime, icon=''},
        },
        lualine_z = { 'location' }
    }
})

nightfox_conf.options.transparent = true
end

return config
