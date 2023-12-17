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

return M
