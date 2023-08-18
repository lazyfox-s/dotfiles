local M = {}

local skkelton_init = function()
    local home = os.getenv('HOME')
    local dict_dir = home..'/.local/share/skk'
    vim.fn['skkeleton#config']({
        eggLikeNewline = true,
        globalDictionaries = {
            dict_dir..'/SKK-JISYO.L',
            dict_dir..'/SKK-JISYO.jinmei',
            dict_dir..'/SKK-JISYO.geo',
            dict_dir..'/SKK-JISYO.station',
            dict_dir..'/SKK-JISYO.propernoun',
        }
    })

    local opts = {}
    opts['Z<Space>'] = {'\\u3000', ''}

    vim.fn['skkeleton#register_kanatable']('rom', opts)
end

M.init = function()
    vim.api.nvim_create_augroup('skkeleton-initialize-pre', {})
    vim.api.nvim_create_autocmd('User', {
        pattern = 'skkeleton-initialize-pre',
        group = 'skkeleton-initialize-pre',
        callback = skkelton_init
    })
end

M.keys = {
    {'<C-j>', '<Plug>(skkeleton-toggle)', mode = {'i', 'c'}},
}

return M
