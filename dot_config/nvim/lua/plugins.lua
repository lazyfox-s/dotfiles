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
        init = require('config/vim_smoothie')
    },
    -- Text Object
    {
        'sgur/vim-textobj-parameter',
        lazy = false,
        dependencies = {
            'kana/vim-textobj-user'
        }
    },
    {
        'kana/vim-textobj-entire',
        lazy = false,
        dependencies = {
            'kana/vim-textobj-user'
        }
    },
    -- Operator
    {
        'kana/vim-operator-replace',
        keys = {{'<Plug>(operator-replace)', mode = {'n', 'x', 'o'}}},
        dependencies = { 'kana/vim-operator-user' }
    },
    {
        'machakann/vim-sandwich',
        keys = {'ys', 'yss', 'yS', 'ds', 'dss', 'cs', 'css', {'S', mode = 'x'}},
        init = require('config/sandwich').init,
        config = require('config/sandwich').config
    }
}
