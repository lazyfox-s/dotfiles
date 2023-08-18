local M = {}

M.config = function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')

    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn['vsnip#anonymous'](args.body)
            end,
        },
        window = {
            completion = cmp.config.window.bordered({
                border = 'single'
            }),
            documentation = cmp.config.window.bordered({
                border = 'single'
            })
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<CR>'] = cmp.mapping.confirm({ select = false })
        }),
        sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'nvim_lsp_signature_help' },
            { name = 'vsnip' },
        }, {
            { name = 'buffer' }
        }),
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol',
                maxwidth = 50,
                elipsis_char = '...'
            })
        },
    })

    cmp.setup.cmdline({ '/', '?' }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = 'buffer' }
        }
    })

    cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = 'path' }
        }, {
            { name = 'cmdline' }
        })
    })

    require('cmp_nvim_lsp').default_capabilities()
end

return M
