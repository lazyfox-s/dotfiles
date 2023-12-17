local lazy_require = require('utils').lazy_require

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
        keys = require('plugins.bufferline').keys,
        config = require('plugins.bufferline').config,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = require('plugins.dashboard')
    },
    {
        'petertriho/nvim-scrollbar',
        event = {'BufReadPost', 'BufNewFile'},
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
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {window = {blend = 0}}
    },
    {
        'lukas-reineke/indent-blankline.nvim',
        event = {'BufReadPost', 'BufNewFile'},
        config = require('plugins.indent_blankline').config
    },
    {
        "tversteeg/registers.nvim",
        name = "registers",
        keys = {
            { "\"",    mode = { "n", "v" } },
            { "<C-R>", mode = "i" }
        },
        cmd = "Registers",
        opts = { window = {
            border = 'single',
            transparency = 20
        }}
    },
    {
        'rcarriga/nvim-notify',
        init = function () vim.notify = lazy_require('notify') end,
        opts = {
            render = 'compact',
            background_colour = '#000000'
        }
    },
    {
        'mbbill/undotree',
        cmd = 'UndotreeToggle',
        init = function ()
            vim.g.undotree_SetFocusWhenToggle = true
        end
    },
    {
        'kwkarlwang/bufresize.nvim',
        opts = {}
    },
    {
        'stevearc/dressing.nvim',
        init = function ()
            vim.ui.input = lazy_require('dressing.input')
            vim.ui.select = lazy_require('dressing.select')
        end,
        opts = {}
    },
    {
        '3rd/image.nvim',
        ft = 'markdown',
        opts = {
            -- max_width_window_percentage = 25,
            max_height_window_percentage = 10
        },
        dependencies = { 'leafo/magick' }
    },
    {
        'myusuf3/numbers.vim',
        lazy = false,
        init = function() vim.g.numbers_exclude = {'SidebarNvim', 'dashboard', 'TelescopePrompt'} end
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
        keys = {{'R', '<Plug>(operator-replace)', mode = {'n', 'x', 'o'}, remap = true}},
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
        'tommcdo/vim-exchange',
        keys = require('plugins.exchange').keys,
        init = require('plugins.exchange').init
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
            'lambdalisue/fern-renderer-nerdfont.vim',
            'lambdalisue/fern-git-status.vim',
            'lambdalisue/nerdfont.vim',
            'lambdalisue/glyph-palette.vim'
        }
    },
    {
        'stevearc/oil.nvim',
        cmd = 'Oil',
        opts = require('plugins.oil').opts,
        init = require('plugins.oil').init,
        dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
    -- syntax highlighting
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = {'BufReadPost', 'BufNewFile'},
        commit = '33eb472',
        cmd = 'TSUpdateSync',
        config = require('plugins.treesitter').config,
        dependencies = {
            'HiPhish/rainbow-delimiters.nvim',
            {'folke/todo-comments.nvim', opts = {}},
            {'norcalli/nvim-colorizer.lua', opts = {}},
            {'haringsrob/nvim_context_vt', opts = {enabled = true, prefix = ''}},
            {'nvim-treesitter/nvim-treesitter-context', opts = {}}
        }
    },
    -- Completion
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {}
    },
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
        dependencies = {
            'j-hui/fidget.nvim',
            'folke/trouble.nvim'
        }
    },
    {
        'akinsho/flutter-tools.nvim',
        event = {'BufReadPre', 'BufNewFile'},
        opts = {},
        dependencies = {
            'nvim-lua/plenary.nvim',
            'neovim/nvim-lspconfig',
            'nvimdev/lspsaga.nvim',
        }
    },
    {
        'nvimdev/lspsaga.nvim',
        opts = require('plugins.lspsaga').opts,
        cmd = 'Lspsaga',
        init = require('plugins.lspsaga').init,
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'nvim-tree/nvim-web-devicons'
        }
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
            'hrsh7th/cmp-emoji',
            'hrsh7th/cmp-calc',
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
        init = require('plugins.committia').init
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
    -- memo
    {
        'fuenor/qfixhowm',
        keys = { 'g,' },
        init = require('plugins.howm').init
    },
    -- Library
    {
        'leafo/magick',
        build = 'mkdir -p lua && cp -r magick lua/'
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
    {
        'rmagatti/auto-session',
        cmd = 'SessionRestore',
        event = {'BufReadPost', 'BufNewFile'},
        opts = { auto_restore_enabled = false }
    },
    {
        'anuvyklack/hydra.nvim',
        keys = require('plugins.hydra').keys,
        config = require('plugins.hydra').config,
        dependencies = {
            'akinsho/toggleterm.nvim',
            'jbyuki/venn.nvim',
            'nvimdev/lspsaga.nvim',
            'folke/trouble.nvim'
            --'sidebar-nvim/sidebar.nvim'
        }
    },
    {
        'vim-jp/vimdoc-ja',
        event = 'CmdlineEnter',
    },
    {
        'jghauser/mkdir.nvim',
        event = {'BufWritePre'},
    },
    {
        'tyru/capture.vim',
        cmd = 'Capture'
    },
    {
        'kevinhwang91/nvim-bqf',
        ft = 'qf'
    },
    {
        'AndrewRadev/linediff.vim',
        cmd = 'Linediff'
    },
    {
        'thinca/vim-partedit',
        cmd = 'Partedit'
    },
}
