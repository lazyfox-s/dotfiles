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
        keys = require('config.hop').keys,
        config = require('config.hop').config
    },
    {
        'psliwka/vim-smoothie',
        keys = {'<C-D>', '<C-U>', '<C-F>', '<S-Down>', '<PageDown>', '<C-B>', '<S-Up>', '<PageUp>', 'gg', 'G'},
        init = require('config/vim_smoothie')
    },
    -- Text Object
    {
        'sgur/vim-textobj-parameter',
        keys = {{'aa', mode = 'o'}, {'ia', mode = 'o'}},
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
        keys = {{'<Plug>(operator-replace)', mode = {'n', 'x', 'o'}}},
        dependencies = { 'kana/vim-operator-user' }
    },
    {
        'machakann/vim-sandwich',
        keys = {'ys', 'yss', 'yS', 'ds', 'dss', 'cs', 'css', {'S', mode = 'x'}},
        init = require('config/sandwich').init,
        config = require('config/sandwich').config
    },
    {
        'machakann/vim-highlightedundo',
        keys = {
            '<Plug>(highlightedundo-undo)', '<Plug>(highlightedundo-Undo)',
            '<Plug>(highlightedundo-gplus)', '<Plug>(highlightedundo-gminus)',
            '<Plug>(highlightedundo-redo)'
        },
        init = require('config/highlightedundo')
    },
    {
        'obcat/vim-highlightedput',
        keys = {
            {'<Plug>(highlightedput-p)', mode = {'n', 'x'}},
            {'<Plug>(highlightedput-P)', mode = {'n', 'x'}},
            {'<Plug>(highlightedput-gp)', mode = {'n', 'x'}},
            {'<Plug>(highlightedput-gP)', mode = {'n', 'x'}},
            {'<Plug>(highlightedput-[P)', mode = {'n', 'x'}},
            {'<Plug>(highlightedput-[p)', mode = {'n', 'x'}},
            {'<Plug>(highlightedput-]p)', mode = {'n', 'x'}},
            {'<Plug>(highlightedput-]P)', mode = {'n', 'x'}},
            {'<Plug>(highlightedput-zp)', mode = {'n', 'x'}},
            {'<Plug>(highlightedput-zP)', mode = {'n', 'x'}},
        },
        init = require('config/highlightedput')
    },
    {
        'mvllow/modes.nvim',
        event = 'ModeChanged',
        config = require('config/modes')
    }
}
