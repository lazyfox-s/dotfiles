local M = {}

M.keys = {
    '<space>', 'z', '<C-w>', '<leader>l', '<leader>g', '<leader>o'

}

M.config = function()

local hydra = require('hydra')

local hintMain = [[
  ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ^ ^           Main Menu
   ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       
         ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     _f_: fuzzy finder      _g_: source control
          ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    _m_: qfixmemo          _w_: vimwiki
         ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   _s_: restore session   _l_: LSP
  ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  _d_: draw diagram      _u_: undo tree
 ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   _o_: options           _c_: dotfiles
⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  _t_: toggle term
⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ 
     ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     _q_: exit
      ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     
    ⢰⣶  ⣶ ⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦  ⣴⣶     
    ⢸⣿⠶⠶⣿ ⠈⢻⣿⠁ ⣿⡇ ⢸⣿⢸⣿⢶⣾⠏ ⣸⣟⣹⣧    
    ⠸⠿  ⠿  ⠸⠿  ⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆   
]]

hydra({
    name = 'Main',
    hint = hintMain,
    config = {
        buffer = bufnr,
        color = 'blue',
        invoke_on_body = true,
        hint = {
            border = 'none'
        },
        on_enter = function()
            vim.o.winblend = 20
        end,
    },
    mode = 'n',
    body = '<space>',
    heads = {
        { 'f', ':Telescope<CR>'},
        { 'g', '<leader>g', { remap = true }},
        { 'm', ':call qfixmemo#EditNew()<CR>'},
        { 'w', ':VimwikiIndex<CR>' },
        { 's', ':SessionRestore<CR>'},
        { 'l', '<leader>l', { remap = true } },
        { 'o', '<leader>o', { remap = true } },
        { 'u', ':UndotreeToggle<CR>'},
        { 't', ':ToggleTerm<CR>'},
        { 'd', '<leader>d', { remap = true } },
        { 'c', ':Telescope find_files prompt_title=dotfiles cwd=$HOME/.local/share/chezmoi<CR>'},
        { 'q', nil, { exit = true, nowait = true, desc = 'exit' } },
    }
})


local hintFold = [[
^ ^            Fold

_a_: toggle         _A_: toggle all

_c_: close          _o_: open
_C_: close All      _O_: open all

_m_: fold level +1  _r_: fold level -1
_M_: fold level =0  _R_: fold level =X

_v_: open to cursor

^ ^                 _q_: exit
]]

hydra({
    name = 'Fold',
    hint = hintFold,
    config = {
        buffer = bufnr,
        color = 'pink',
        invoke_on_body = true,
        hint = {
            border = 'none'
        },
        on_enter = function()
            vim.o.winblend = 20
        end,
    },
    mode = 'n',
    body = 'z',
    heads = {
        { 'a', 'za'},
        { 'A', 'zA', { exit = true }},
        { 'c', 'zc'},
        { 'o', 'zo'},
        { 'C', 'zC', { exit = true }},
        { 'O', 'zO', { exit = true }},
        { 'm', 'zm'},
        { 'r', 'zr'},
        { 'M', 'zM', { exit = true }},
        { 'R', 'zR', { exit = true }},
        { 'v', 'zv', { exit = true }},
        { 'q', nil, { exit = true, nowait = true, desc = 'exit' } },
    }
})

local hintWindow = [[
                Window
 _w_: focus next  _p_: focus prev  _q_: exit

 ^F^o^c^u^s^  ^M^o^v^e^ ^  ^R^e^s^i^z^e  ^ ^     Split
 ^-^-^-^-^-^--^-^-^-^-^-^--^-^-^-^-^-^---^-^---------------
 ^ ^ _k_ ^ ^  ^ ^ _K_ ^ ^  ^ ^ _+_ ^ ^   _s_: horizontally 
 _h_ ^ ^ _l_  _H_ ^ ^ _L_  _<_ ^ ^ _>_   _v_: vertically
 ^ ^ _j_ ^ ^  ^ ^ _J_ ^ ^  ^ ^ _-_ ^ ^   _c_: close
 ^ ^ ^ ^ ^ ^  ^ ^ ^ ^ ^ ^  ^ ^ ^ ^ ^ ^   _o_: remain only
]]

hydra({
    name = 'Window',
    hint = hintWindow,
    config = {
        buffer = bufnr,
        color = 'pink',
        invoke_on_body = true,
        hint = {
            border = 'none'
        },
        on_enter = function()
            vim.o.winblend = 20
        end,
    },
    mode = 'n',
    body = '<C-w>',
    heads = {
        { 'w', '<C-w>w' },
        { 'p', '<C-w>p' },
        { 'h', '<C-w>h', { exit = true } },
        { 'l', '<C-w>l', { exit = true } },
        { 'j', '<C-w>j', { exit = true } },
        { 'k', '<C-w>k', { exit = true } },
        { 'H', '<C-w>H' },
        { 'L', '<C-w>L' },
        { 'J', '<C-w>J' },
        { 'K', '<C-w>K' },
        { '+', '<C-w>+' },
        { '-', '<C-w>-' },
        { '<', '<C-w><' },
        { '>', '<C-w>>' },
        { 's', '<C-w>n' },
        { 'v', '<C-w>v' },
        { 'c', '<C-w>c' },
        { 'o', '<C-w>o' },
        { 'q', nil, { exit = true, nowait = true, desc = 'exit' } },
    }
})


local hintGit = [[
^ ^        Source Control

_l_: lazygit        _s_: status

_<_: stage hunk     _>_: reset hunk
_u_: undo stage
_S_: stage buffer   _R_: reset buffer

_n_: next hunk      _p_: prev hunk

_d_: diff this      _v_: preview hunk

^ ^                 _q_: exit
]]

local gs = require('gitsigns')

hydra({
    name = 'Git',
    hint = hintGit,
    config = {
        buffer = bufnr,
        color = 'pink',
        invoke_on_body = true,
        hint = {
            border = 'none'
        },
        on_enter = function()
            vim.o.winblend = 20
        end,
    },
    mode = 'n',
    body = '<leader>g',
    heads = {
        { 'l', ':LazyGit<CR>', { exit = true }},
        { 's', ':GinStatus<CR>', { exit = true }},
        { '<', ':Gitsigns stage_hunk<CR>'},
        { '>', ':Gitsigns reset_hunk<CR>' },
        { 'u', gs.undo_stage_hunk },
        { 'S', gs.stage_buffer},
        { 'R', gs.reset_buffer},
        { 'd', gs.diffthis},
        { 'v', gs.preview_hunk},
        { 'n', gs.next_hunk },
        { 'p', gs.prev_hunk },
        { 'q', nil, { exit = true, nowait = true, desc = 'exit' } },
    }
})


local hintLSP = [[
^ ^             LSP

_a_: code action    _F_: Format
_r_: rename         _R_: project-wide replace

_h_: hover doc      _o_: show outline
_f_: finder

_d_: diag in line   _D_: diag in project

^ ^                 _q_: exit
]]

local lsp = vim.lsp.buf

hydra({
    name = 'LSP',
    hint = hintLSP,
    config = {
        buffer = bufnr,
        color = 'blue',
        invoke_on_body = true,
        hint = {
            border = 'none'
        },
        on_enter = function()
            vim.o.winblend = 20
        end,
    },
    mode = 'n',
    body = '<leader>l',
    heads = {
        { 'a', '<cmd>Lspsaga code_action<CR>'},
        { 'F', lsp.format},
        { 'f', '<cmd>Lspsaga finder<CR>'},
        { 'r', '<cmd>Lspsaga rename<CR>'},
        { 'R', '<cmd>Lspsaga rename ++project<CR>'},
        { 'h', '<cmd>Lspsaga hover_doc<CR>'},
        { 'o', '<cmd>Lspsaga outline<CR>'},
        { 'd', '<cmd>Lspsaga show_line_diagnostics ++unfocus<CR>'},
        { 'D', '<cmd>Trouble<CR>'},
        { 'q', nil, { exit = true, nowait = true, desc = 'exit' } },
    }
})

local option_func = {}

option_func.smoothie = function()
    if vim.g.smoothie_enabled == 1 then
        return '[x]'
    else
        return '[ ]'
    end
end

option_func.sidebar = function()
    local windows = vim.api.nvim_list_wins()
    for i = 1, #windows do
        if vim.api.nvim_get_option_value('filetype', {win = windows[i]}) == 'SidebarNvim' then
            return '[x]'
        end
    end
    return '[ ]'
end

option_func.relative = function()
    if vim.o.relativenumber then
        return '[x]'
    else
        return '[ ]'
    end
end

option_func.spell = function()
    if vim.o.spell then
        return '[x]'
    else
        return '[ ]'
    end
end

option_func.terminal = function()
    local windows = vim.api.nvim_list_wins()
    for i = 1, #windows do
        if vim.api.nvim_get_option_value('filetype', {win = windows[i]}) == 'toggleterm' then
            return '[x]'
        end
    end
    return '[ ]'
end

option_func.virtual = function()
    if vim.o.virtualedit == 'all' then
        return '[x]'
    else
        return '[ ]'
    end
end

-- local sidebar = require('sidebar-nvim')
local terminal = require('toggleterm')

local hintOptions = [[
^ ^    Options

_v_ %{virtual} virtual edit
_s_ %{smoothie} smooth scroll
_b_ %{sidebar} side bar
_r_ %{relative} relative number
_p_ %{spell} spell
_t_ %{terminal} terminal

_q_ quit
]]

hydra({
    name = 'Options',
    hint = hintOptions,
    config = {
        buffer = bufnr,
        color = 'pink',
        invoke_on_body = true,
        hint = {
            border = 'none',
            funcs = option_func
        },
        on_enter = function()
            vim.o.winblend = 20
        end,
    },
    mode = 'n',
    body = '<Leader>o',
    heads = {
        { 'v', function()
            if vim.o.virtualedit == 'all' then
                vim.o.virtualedit = 'block'
            else
                vim.o.virtualedit = 'all'
            end
        end},
        { 's', function()
            if vim.g.smoothie_enabled == 1 then
                vim.g.smoothie_enabled = 0
            else
                vim.g.smoothie_enabled = 1
            end
        end},
        { 'b', function() require('sidebar-nvim').toggle() end},
        { 'r', function()
            if vim.o.relativenumber then
                vim.o.relativenumber = false
            else
                vim.o.relativenumber = true
            end
        end},
        { 'p', function()
            if vim.o.spell then
                vim.o.spell = false
            else
                vim.o.spell = true
            end
        end},
        { 't', terminal.toggle_command, { exit = true }},
        { 'q', nil, { exit = true, nowait = true, desc = 'exit' } },
    }
})


local hint_venn = [[
 Arrow^^^^^^   Select region with <C-v> 
 ^ ^ _K_ ^ ^   _f_: surround it with box
 _H_ ^ ^ _L_
 ^ ^ _J_ ^ ^                      _<Esc>_
]]

hydra({
   name = 'Draw Diagram',
   hint = hint_venn,
   config = {
      color = 'pink',
      invoke_on_body = true,
      hint = {
         border = 'rounded'
      },
      on_enter = function()
         vim.o.virtualedit = 'all'
      end,
   },
   mode = 'n',
   body = '<leader>d',
   heads = {
      { 'H', '<C-v>h:VBox<CR>' },
      { 'J', '<C-v>j:VBox<CR>' },
      { 'K', '<C-v>k:VBox<CR>' },
      { 'L', '<C-v>l:VBox<CR>' },
      { 'f', ':VBox<CR>', { mode = 'v' }},
      { '<Esc>', nil, { exit = true } },
   }
})
end

return M
