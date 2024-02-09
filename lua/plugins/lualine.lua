return {
    'nvim-lualine/lualine.nvim',
    config = function()
        require('lualine').setup({
            options = {
                theme = 'dracula'
            },
            winbar = {
                  lualine_a = {{'filename', path=1}},
                  lualine_b = {},
                  lualine_c = {},
                  lualine_x = {},
                  lualine_y = {},
                  lualine_z = {}
            },
            inactive_winbar  = {
                  lualine_a = {},
                  lualine_b = {{'filename', path=1}},
                  lualine_c = {},
                  lualine_x = {},
                  lualine_y = {},
                  lualine_z = {}
            }
        })
    end
}
