local M = {}

local symbols = {
    Error=' ', Warn=' ', Info=' ', Hint=' '
}

local setSymbols = function()
    for type, icon in pairs(symbols) do
        local hl = 'DiagnosticSign'..type
        vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = hl})
    end
end

M.config = function()
    setSymbols()

    require('neodev').setup({})
    require("mason").setup({
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    })

    require("mason-lspconfig").setup()


    local nvim_lsp = require('lspconfig')
    local mason_lspconfig = require('mason-lspconfig')
    mason_lspconfig.setup_handlers({ function(server_name)
        local opts = {}
        nvim_lsp[server_name].setup(opts)
    end })
end

return M
