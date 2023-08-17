return {
    -- Visual
    {   -- colorscheme
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('config/nightfox')()
            vim.cmd([[colorscheme carbonfox]])
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        config = require('config/lualine')
    },
    {
        'akinsho/bufferline.nvim',
        lazy = false,
        config = require('config/bufferline')
    },
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = require('config/dashboard')
    }
}
