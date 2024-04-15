local M = {}

M.lazy_require = function(plugin)
    return setmetatable({}, {
        __index = function(_, key)
            return function(...)
                return require(plugin)[key](...)
            end
        end,

        __call = function(_, ...)
            return require(plugin)(...)
        end
    })
end

M.convert_to_superscript = function (text)
    local conv_table = {
        ['0'] = '⁰',
        ['1'] = '¹',
        ['2'] = '²',
        ['3'] = '³',
        ['4'] = '⁴',
        ['5'] = '⁵',
        ['6'] = '⁶',
        ['7'] = '⁷',
        ['8'] = '⁸',
        ['9'] = '⁹',
        ['-'] = '⁻',
        [':'] = '˸'
    }

    local s = text
    for k, v in pairs(conv_table) do
        s = string.gsub(s, k, v)
    end
    return s
end

M.right_alignment = function (text, width)
    local str_width = vim.fn.strwidth(text)
    local space = width - str_width
    return string.rep(' ', space)..text
end

M.wrap_text = function (text, width)
    return vim.fn.split(text, '\\%>'..width..'v')
end

return M
