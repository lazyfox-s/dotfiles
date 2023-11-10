local M = {}

local function moveNextBuf()
    local bline = require('bufferline')
    local count = vim.v.count

    if count == 0 then
        vim.cmd.BufferLineCycleNext()
        return
    end

    bline.go_to(count, true)
end

M.keys = {
    { 'bn', moveNextBuf},
    { 'bN', '<cmd>BufferLineCyclePrev<CR>' }
}

M.config = function ()

require('bufferline').setup{
    options = {
        offsets = {
            {
                filetype = 'SidebarNvim',
                text = 'Sidebar',
                highlight = 'Tabline'
            },
            {
                filetype = 'help',
                text = 'Help',
                highlight = 'Tabline'
            },
            {
                filetype = 'fern',
                text = 'Fern',
                highlight = 'Tabline'
            }
        },
        diagnostics = false,
        themable = true,
        numbers = 'ordinal'
    },
    highlights = {
        fill = {
            bg = {
                attribute = 'bg',
                highlight = 'TabLineFill'
            }
        },
        background = {
            bg = {
                attribute = 'bg',
                highlight = 'TabLine'
            }
        },
        tab = {
            bg = {
                attribute = 'bg',
                highlight = 'TabLine'
            }
        },
        tab_selected = {
            bg = {
                attribute = 'bg',
                highlight = 'PmenuThumb'
            }
        },
        tab_close = {
            bg = {
                attribute = 'bg',
                highlight = 'TabLine'
            }
        },
        buffer_visible = {
            bg = {
                attribute = 'bg',
                highlight = 'TabLine'
            }
        },
        buffer_selected = {
            bg = {
                attribute = 'bg',
                highlight = 'PmenuThumb'
            }
        },
        close_button = {
            bg = {
                attribute = 'bg',
                highlight = 'TabLine'
            }
        },
        close_button_visible = {
            bg = {
                attribute = 'bg',
                highlight = 'TabLine'
            }
        },
        close_button_selected = {
            bg = {
                attribute = 'bg',
                highlight = 'PmenuThumb'
            }
        },
        separator = {
            bg = {
                attribute = 'bg',
                highlight = 'TabLine'
            }
        },
        separator_visible = {
            bg = {
                attribute = 'bg',
                highlight = 'TabLine'
            }
        },
        separator_selected = {
            bg = {
                attribute = 'bg',
                highlight = 'PmenuThumb'
            }
        },
        modified_visible = {
            bg = {
                attribute = 'bg',
                highlight = 'TabLine'
            }
        },
        modified_selected = {
            bg = {
                attribute = 'bg',
                highlight = 'PmenuThumb'
            }
        },
        indicator_selected = {
            bg = {
                attribute = 'bg',
                highlight = 'PmenuThumb'
            }
        },
        numbers = {
            bg = {
                attribute = 'bg',
                highlight = 'TabLine'
            }
        },
        numbers_visible = {
            bg = {
                attribute = 'bg',
                highlight = 'TabLine'
            }
        },
        numbers_selected = {
            bg = {
                attribute = 'bg',
                highlight = 'PmenuThumb'
            }
        },
        duplicate = {
            bg = {
                attribute = 'bg',
                highlight = 'TabLine'
            },
        },
        duplicate_visible = {
            bg = {
                attribute = 'bg',
                highlight = 'TabLine'
            },
        },
        duplicate_selected = {
            bg = {
                attribute = 'bg',
                highlight = 'PmenuThumb'
            },
            fg = {
                attribute = 'fg',
                highlight = 'PmenuThumb'
            },
        },
    }
}

end

return M
