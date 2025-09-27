
local M = {}

M.opts = {
    adapters = {
        http = {
            opts = {
                show_defaults = false,
            },
            ollama_gemma3 = function ()
                return require('codecompanion.adapters').extend('ollama', {
                    schema = {
                        model = {
                            default = 'gemma3:12b-it-q4_K_M'
                        }
                    }
                })
            end,
            ollama_codegemma = function ()
                return require('codecompanion.adapters').extend('ollama', {
                    schema = {
                        model = {
                            default = 'codegemma:7b'
                        }
                    }
                })
            end,
            ollama_qwen = function ()
                return require('codecompanion.adapters').extend('ollama', {
                    schema = {
                        model = {
                            default = 'qwen2.5-coder:7b'
                        }
                    }
                })
            end,
        },
    },
    strategies = {
        chat = {
            adapter = 'copilot',
            roles = {
                llm = function(adapter)
                    return '󱙺  CodeCompanion ('..adapter.formatted_name..')'
                end,
                user = '󰀄  Me'
            },
        },
        inline = {
            adapter = 'copilot'
        },
        agent = {
            adapter = 'copilot'
        },
    },
    display = {
        chat = {
            auto_scroll = true,
            show_header_separator = true,
            window = {
                layout = 'vertical',
                position = 'right'
            }
        },
    },
    opts = {
        language = 'Japanese'
    }
}

M.init = function ()
    local group = vim.api.nvim_create_augroup("CodeCompanionFidgetHooks", {})

    vim.api.nvim_create_autocmd({ "User" }, {
        pattern = "CodeCompanionRequestStarted",
        group = group,
        callback = function(request)
            local handle = M:create_progress_handle(request)
            M:store_progress_handle(request.data.id, handle)
        end,
    })

    vim.api.nvim_create_autocmd({ "User" }, {
        pattern = "CodeCompanionRequestFinished",
        group = group,
        callback = function(request)
            local handle = M:pop_progress_handle(request.data.id)
            if handle then
                M:report_exit_status(handle, request)
                handle:finish()
            end
        end,
    })
end

M.handles = {}

function M:store_progress_handle(id, handle)
    M.handles[id] = handle
end

function M:pop_progress_handle(id)
    local handle = M.handles[id]
    M.handles[id] = nil
    return handle
end

function M:create_progress_handle(request)
    return require('fidget.progress').handle.create({
        title = " Requesting assistance (" .. request.data.strategy .. ")",
        message = "In progress...",
        lsp_client = {
            name = M:llm_role_title(request.data.adapter),
        },
    })
end

function M:llm_role_title(adapter)
    local parts = {}
    table.insert(parts, adapter.formatted_name)
    if adapter.model and adapter.model ~= "" then
        table.insert(parts, "(" .. adapter.model .. ")")
    end
    return table.concat(parts, " ")
end

function M:report_exit_status(handle, request)
    if request.data.status == "success" then
        handle.message = " Completed"
    elseif request.data.status == "error" then
        handle.message = " Error"
    else
        handle.message = "󰜺 Cancelled"
    end
end

return M
