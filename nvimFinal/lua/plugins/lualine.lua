-- local mine = -- {
    --     'nvim-lualine/lualine.nvim',
    --     dependencies = { 'nvim-tree/nvim-web-devicons'},
    --     config = function ()
    --         require('lualine').setup {
    --             options = {
    --                 icons_enabled = true,
    --                 theme = 'auto',
    --                 component_separators = { left = '', right = ''},
    --                 section_separators = { left = '', right = ''},
    --                 disabled_filetypes = {
    --                     statusline = {},
    --                     winbar = {},
    --                 },
    --                 ignore_focus = {},
    --                 always_divide_middle = true,
    --                 globalstatus = true,
    --                 refresh = {
    --                     statusline = 1000,
    --                     tabline = 1000,
    --                     winbar = 1000,
    --                 }
    --             },
    --             sources = { 'nvim_diagnostic','nvim_lsp','metals'},
    --             filetype_names = {
    --                 TelescopePrompt = 'Telescope',
    --                 dashboard = 'Dashboard',
    --                 packer = 'Packer',
    --                 fzf = 'FZF',
    --                 alpha = 'Alpha'
    --             },
    --             sections = {
    --                 lualine_a = {'mode'},
    --                 lualine_b = {'branch', 'diff', 'diagnostics' , 'metals_status'},
    --                 lualine_c = {'filename'},
    --                 lualine_x = { "g:metals_status", "encoding", "fileformat", "filetype" },
    --                 lualine_y = {'progress'},
    --                 lualine_z = {'location'}
    --             },
    --             inactive_sections = {
    --                 lualine_a = {},
    --                 lualine_b = {},
    --                 lualine_c = {'filename'},
    --                 lualine_x = {'location'},
    --                 lualine_y = {},
    --                 lualine_z = {}
    --             },
    --             tabline = {},
    --             winbar = {},
    --             inactive_winbar = {},
    --             extensions = {}
    --         }
    --
    --
    --     end
    -- }
return {
    'nvim-lualine/lualine.nvim',
    opts = function()
        return {
            sources = { 'nvim_diagnostic','nvim_lsp','metals'},
            sections = {
                lualine_x = { "g:metals_status", "encoding", "fileformat", "filetype" }
            }
        }
    end
}


