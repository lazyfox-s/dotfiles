local config = function()
    require('nightfox').setup({
        options = {
            transparent = true,
            dim_inactive = false,
            module_default = false
        },
        groups = {
            all = {
                DashboardHeader = {}
            }
        }
    })
end

return config
