local M = {}

M.cmd = {'ToggleTerm', 'LazyGit', 'RunTask'}

M.config = function()
    require('toggleterm').setup()

    local title = 'Task Runner'

    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new({
        cmd = 'lazygit',
        direction = 'float',
        hidden = true,
        close_on_exit = true,
        on_open = function(_)
            vim.api.nvim_del_keymap('t', '<ESC>')
            vim.opt.winblend = 20
        end,
        on_exit = function(_)
            vim.api.nvim_set_keymap('t', '<ESC>', [[<C-\><C-n>]], {noremap = true})
        end
    })

    local function lazygit_toggle()
        lazygit:toggle()
    end

    local function runtask(opts)
        local cmd = opts.args
        local start = function(_)
            vim.notify('Running `'..cmd..'`...' , 'info', {title = title})
        end

        local cmd_exited = function(_, _, code, _)
            local status = 'error'
            local opt = {title = title}
            if code == 0 then
                status = 'info'
                opt.icon = ' '
            end
            vim.notify('Exited `'..cmd..'` (code: '..code..')', status, opt)
        end

        local command = Terminal:new({
            cmd=cmd,
            hidden = false,
            close_on_exit = false,
            on_open = start,
            on_exit = cmd_exited,
            auto_scroll = true
        })
        command:toggle()
    end

    vim.api.nvim_create_user_command('RunTask', runtask, { nargs = 1 })
    vim.api.nvim_create_user_command('LazyGit', lazygit_toggle, {})
end

return M
