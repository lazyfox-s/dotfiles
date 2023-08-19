local M = {}

M.config = function()
require('nvim-web-devicons').setup({
    strict = true;
    override_by_filename = {
        ['dockerfile'] = {
            icon = '',
            color = '#458ee6',
            name = 'Dockerfile'
        },
        ['docker-compose.yml'] = {
            icon = '',
            color = '#458ee6',
            name = 'Dockerfile'
        }
    };
})
end

return M
