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
        config = require('plugins.bufferline'),
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = require('plugins.dashboard')
    },
    {
        'petertriho/nvim-scrollbar',
        event = 'CmdlineEnter',
        config = require('plugins.scrollbar').config,
        dependencies = {
            'kevinhwang91/nvim-hlslens',
            'lewis6991/gitsigns.nvim',
        }
    },
    {
        'kevinhwang91/nvim-hlslens',
        config = require('plugins.hlslens').config,
        dependencies = { 'haya14busa/vim-asterisk' }
    },
    {
        'sidebar-nvim/sidebar.nvim',
        -- keys = require('plugins.sidebar').keys,
        init = require('plugins.sidebar').init,
        config = require('plugins.sidebar').config
    },
    {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        opts = {window = {blend = 0}}
    },
    -- Motion
    {
        'unblevable/quick-scope',
        keys = require('plugins.quick-scope').keys,
        init = require('plugins.quick-scope').init,
        config = require('plugins.quick-scope').config
    },
    {
        'ggandor/leap.nvim',
        keys = require('plugins.leap').keys,
        config = require('plugins.leap').config,
        dependencies = { 'tpope/vim-repeat' }
    },
    {
        'haya14busa/vim-edgemotion',
        keys = require('plugins.edgemotion').keys
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
    },
    -- Finder
    {
        'nvim-telescope/telescope.nvim',
        keys = require('plugins.telescope').keys,
        config = require('plugins.telescope').config,
        cmd = 'Telescope',
        dependencies = {
            'kkharji/sqlite.lua',
            'nvim-lua/plenary.nvim',
            {
                'prochri/telescope-all-recent.nvim',
                config = require('plugins.telescope-all-recent').config
            },
        }
    },
    {
        'lambdalisue/fern.vim',
        cmd = 'Fern',
        keys = require('plugins.fern').keys,
        init = require('plugins.fern').init,
        dependencies = {
            'lambdalisue/fern-hijack.vim',
            'lambdalisue/fern-renderer-nerdfont.vim',
            'lambdalisue/fern-git-status.vim',
            'lambdalisue/nerdfont.vim',
            'lambdalisue/glyph-palette.vim'
        }
    },
    -- syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = {'BufReadPost', 'BufNewFile'},
        cmd = 'TSUpdateSync',
        config = require('plugins.treesitter').config,
        dependencies = {
            'p00f/nvim-ts-rainbow',
            {'folke/todo-comments.nvim', opts = {}},
            {'norcalli/nvim-colorizer.lua', opts = {}},
            {'haringsrob/nvim_context_vt', opts = {enabled = true, prefix = ''}}
        }
    },
    -- Completion
    { --- lsp
        'williamboman/mason.nvim',
        event = {'BufReadPre', 'BufNewFile'},
        config = require('plugins.mason').config,
        dependencies = {
            'folke/neodev.nvim',
            'neovim/nvim-lspconfig',
            'williamboman/mason-lspconfig.nvim'
        }
    },
    {
        'neovim/nvim-lspconfig',
        dependencies = {'j-hui/fidget.nvim'}
    },
    { --- auto completion with snippet
        'hrsh7th/nvim-cmp',
        event = {'InsertEnter', 'CmdlineEnter'},
        config = require('plugins.nvim-cmp').config,
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-buffer',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-cmdline',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            'onsails/lspkind.nvim',
            {'rinx/cmp-skkeleton', dependencies = {'vim-skk/skkeleton'}},
            'hrsh7th/cmp-nvim-lsp-signature-help'
        },
    },
    -- Source Control
    {
        'lewis6991/gitsigns.nvim',
        event = {'BufReadPost', 'BufNewFile'},
        config = require('plugins.gitsigns').config
    },
    {
        'hotwatermorning/auto-git-diff',
        ft = 'gitrebase'
    },
    {
        'rhysd/committia.vim',
        event = 'BufReadPre COMMIT_EDITMSG',
        init = function() vim.g.committia_open_only_vim_starting = false end
    },
    {
        'lambdalisue/gin.vim',
        cmd = 'Gin',
        init = function() vim.g.gin_proxy_apply_without_confirm = true end,
        config = require('plugins.denops').util.discover_plugin,
        dependencies = {
            'vim-denops/denops.vim'
        }
    },
    -- Misc
    {
        'vim-skk/skkeleton',
        keys = require('plugins.skkeleton').keys,
        init = require('plugins.skkeleton').init,
        config = require('plugins.denops').util.discover_plugin,
        dependencies = {
            'vim-denops/denops.vim',
        }
    },
    {
        'akinsho/toggleterm.nvim',
        cmd = require('plugins.toggleterm').cmd,
        config = require('plugins.toggleterm').config
    },
    {
        'famiu/bufdelete.nvim',
        keys = {{'bd', '<cmd>Bdelete<CR>'}}
    },
}
