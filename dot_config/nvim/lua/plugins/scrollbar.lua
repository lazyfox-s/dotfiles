local M = {}

M.config = function()

require('scrollbar.handlers.search').setup({
    calm_down = true,
    nearest_only = true
})

require('scrollbar').setup({
    show = true,
    folds = 1000,
    set_highlights = true,
    hide_if_all_visible = true,
    handle = {
        blend = 0,
        highlight = 'Search',
        text = ' '
    },
    handlers = {
        corsor = true,
        diagnostic = true,
        gitsigns = true,
        search = true,
        handle = true
    },
    marks = {
        Cursor = {
            text = ' ',
            priority = 99,
            highlight = 'Search'
        },
        Search = {
            text = {'-', '='},
            highlight = 'Question'
        },
        Error = {
            text = { '-', '=' }
        },
        Warn = {
            text = { '-', '=' }
        },
        Info = {
            text = { '-', '=' }
        },
        Misc = {
            text = { '-', '=' }
        },
        GitAdd = {
            text = '┃',
            highlight = 'diffAdded'
        },
        GitChange = {
            text = '┃',
            highlight = 'diffChanged'
        },
        GitDelete = {
            text = '▁'
        }
    }
})

end

return M
