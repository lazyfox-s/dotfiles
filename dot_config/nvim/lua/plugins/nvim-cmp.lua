local M = {}

local set_hl = function()
    -- gray
    vim.api.nvim_set_hl(0, 'CmpItemAbbrDeprecated', { bg='NONE', strikethrough=true, fg='#808080' })
    -- blue
    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bg='NONE', fg='#569CD6' })
    vim.api.nvim_set_hl(0, 'CmpItemAbbrMatchFuzzy', { link='CmpIntemAbbrMatch' })
    -- light blue
    vim.api.nvim_set_hl(0, 'CmpItemKindVariable', { bg='NONE', fg='#9CDCFE' })
    vim.api.nvim_set_hl(0, 'CmpItemKindInterface', { link='CmpItemKindVariable' })
    vim.api.nvim_set_hl(0, 'CmpItemKindText', { link='CmpItemKindVariable' })
    -- pink
    vim.api.nvim_set_hl(0, 'CmpItemKindFunction', { bg='NONE', fg='#C586C0' })
    vim.api.nvim_set_hl(0, 'CmpItemKindMethod', { link='CmpItemKindFunction' })
    -- front
    vim.api.nvim_set_hl(0, 'CmpItemKindKeyword', { bg='NONE', fg='#D4D4D4' })
    vim.api.nvim_set_hl(0, 'CmpItemKindProperty', { link='CmpItemKindKeyword' })
    vim.api.nvim_set_hl(0, 'CmpItemKindUnit', { link='CmpItemKindKeyword' })
end

M.config = function()
    set_hl()
    local cmp = require('cmp')
    local lspkind = require('lspkind')

    local default_sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'nvim_lsp_signature_help' },
        { name = 'vsnip' },
        { name = 'path' },
        { name = 'emoji' },
        { name = 'calc' },
        { name = 'copilot' },
    }, {
        { name = 'buffer' }
    })

    local skkeleton_sources = cmp.config.sources({
        { name = 'skkeleton' }
    })

    cmp.setup({
        snippet = {
            expand = function(args)
                vim.fn['vsnip#anonymous'](args.body)
            end,
        },
        window = {
            -- completion = cmp.config.window.bordered({
            --     border = 'single'
            -- }),
            -- documentation = cmp.config.window.bordered({
            --     border = 'single'
            -- })
        },
        mapping = cmp.mapping.preset.insert({
            ['<C-n>'] = cmp.mapping.select_next_item(),
            ['<C-p>'] = cmp.mapping.select_prev_item(),
            ['<CR>'] = cmp.mapping.confirm({ select = false })
        }),
        sources = default_sources,
        formatting = {
            format = lspkind.cmp_format({
                mode = 'symbol_text',
                maxwidth = 50,
                elipsis_char = '...'
            })
        },
        experimental = {
            ghost_text = true
        }
    })

    local group = vim.api.nvim_create_augroup('skkeleton_cmp_source_toggle', { clear = true })
    vim.api.nvim_create_autocmd('User', {
        pattern = 'skkeleton-enable-pre',
        group = group,
        callback = function()
            cmp.setup.buffer({ sources = skkeleton_sources })
        end,
    })
    vim.api.nvim_create_autocmd('User', {
        pattern = 'skkeleton-disable-pre',
        group = group,
        callback = function()
            cmp.setup.buffer({ sources = default_sources })
        end,
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
