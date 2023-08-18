return {
    -- Apparence
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
    },
    -- Motion
    {
        'phaazon/hop.nvim',
        config = require('config/hop')
    },
    {
        'psliwka/vim-smoothie',
        keys = {'<C-D>', '<C-U>', '<C-F>', '<S-Down>', '<PageDown>', '<C-B>', '<S-Up>', '<PageUp>', 'gg', 'G'},
        config = require('config/vim_smoothie')
    }
}
