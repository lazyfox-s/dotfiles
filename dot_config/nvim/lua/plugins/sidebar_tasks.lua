local Loclist = nil
local loclist = nil
local update_debounced = nil

local function parse_rg_out(stdout)
    local data = {}

    for _, line in ipairs(vim.split(stdout, '\n')) do
        local path, lnum, col, text = line:match('^(.+):(%d+):(%d+):%- %[ %] (.*)$')
        data[#data+1] = {
            filepath = path,
            lnum = lnum,
            col = col,
            text = text
        }
    end
    return data
end

local function update_loclist()
    local search_path = require('plugins.obsidian').get_workspace_path()

    vim.system({'rg', '--no-hidden', '--column', '--sortr', 'path', '--', '^- \\[ \\]', search_path}, {cwd='/'}, function(obj)
        if obj.code ~= 0 then
            vim.notify(obj.stderr)
            return
        end

        local parsed = parse_rg_out(obj.stdout)

        if loclist == nil then return end
        loclist:clear()

        for i, data in ipairs(parsed) do
            loclist:add_item({
                group = require('sidebar-nvim.utils').shortest_path(search_path),
                left = {
                    {text = data.text}
                },
                right = {
                    {text = data.path}
                },
                filepath = data.filepath,
                order = i,
                lnum = data.lnum,
                col = data.col,
            })
        end
    end)
end


local tasks_section = {
    title = 'Tasks',
    icon = ' ',
    setup = function(_)
        Loclist = require("sidebar-nvim.components.loclist")
        loclist = Loclist:new({})
        local Debouncer = require('sidebar-nvim.debouncer')
        update_debounced = Debouncer:new(update_loclist, 1000)
    end,
    update = function(_)
        if update_debounced == nil then return end
        update_debounced:call()
    end,
    draw = function (ctx)
        local lines = {}
        local hl = {}
        if loclist == nil then return end
        loclist:draw(ctx, lines, hl)

        if #lines == 0 then
            lines = { "<no TODOs>" }
        end

        return { lines = lines, hl = hl }
    end,
    bindings = {
        ['l'] = function (line)
            if loclist == nil then return end
            local location = loclist:get_location_at(line)
            if not location then
                return
            end
            vim.cmd("wincmd p")
            vim.cmd("e " .. location.filepath)
            vim.fn.cursor(location.lnum, location.col)
        end
    }
}

return tasks_section
