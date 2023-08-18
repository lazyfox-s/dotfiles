
return {
    -- Apparence
    {   -- colorscheme
        'EdenEast/nightfox.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('plugins.nightfox')()
            vim.cmd([[colorscheme carbonfox]])
        end
    },
    {
        'nvim-lualine/lualine.nvim',
        lazy = false,
        config = require('plugins.lualine')
    },
    {
        'akinsho/bufferline.nvim',
        lazy = false,
        config = require('plugins.bufferline')
    },
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = require('plugins.dashboard')
    },
    -- Motion
    {
        'phaazon/hop.nvim',
        keys = require('plugins.hop').keys,
        config = require('plugins.hop').config
    },
    {
        'psliwka/vim-smoothie',
        keys = require('plugins.vim_smoothie').keys,
        init = require('plugins.vim_smoothie').init
    },
    -- Text Object
    {
        'sgur/vim-textobj-parameter',
        keys = {{'aa', mode = 'o'}, {'ia', mode = 'o'}},
        init = function() vim.g.vim_textobj_parameter_mapping = 'a' end,
        dependencies = {
            'kana/vim-textobj-user'
        }
    },
    {
        'kana/vim-textobj-entire',
        keys = {{'ae', mode = 'o'}, {'ie', mode = 'o'}},
        dependencies = {
            'kana/vim-textobj-user'
        }
    },
    -- Operator
    {
        'kana/vim-operator-replace',
        keys = {{'R', '<Plug>(operator-replace)', {mode = '', remap = true}}},
        dependencies = { 'kana/vim-operator-user' }
    },
    {
        'machakann/vim-sandwich',
        keys = require('plugins.sandwich').keys,
        init = require('plugins.sandwich').init,
        config = require('plugins.sandwich').config
    },
    {
        'machakann/vim-highlightedundo',
        keys = require('plugins.highlightedundo').keys,
        init = require('plugins.highlightedundo').init
    },
    {
        'obcat/vim-highlightedput',
        keys = require('plugins.highlightedput').keys
    },
    {
        'mvllow/modes.nvim',
        event = 'ModeChanged',
        config = require('plugins.modes')
    }
}
