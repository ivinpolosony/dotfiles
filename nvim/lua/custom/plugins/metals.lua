-- local M = {}
-- M.wh_key = {
--   wh_mappings = {
--     x = {
--       name = '+Execute',
--       c = {
--         name = '+Code',
--         s = {
--           name = '+Sniprun',
--           c = {
--             "<cmd>lua require'sniprun'.run()<cr>",
--             'Run',
--             mode = { 'n', 'v' },
--           },
--           r = {
--             "<cmd>lua require'sniprun'.reset()<cr>",
--             'Reset',
--             mode = { 'n' },
--           },
--           s = {
--             "<cmd>lua require'sniprun.display'.close_all()<cr>",
--             'Stop',
--             mode = { 'n' },
--           },
--           l = {
--             "<cmd>lua require'sniprun.live_mode'.toggle()<cr>",
--             'Live',
--             mode = { 'n' },
--           },
--           i = {
--             "<cmd>lua require'sniprun'.info()<cr>",
--             'Info',
--             mode = { 'n' },
--           },
--           m = {
--             "<cmd>lua require'sniprun'.clear_repl()<cr>",
--             'Memory Clear',
--             mode = { 'n' },
--           },
--         },
--       },
--     },
--   },
-- }
--
-- M.setup = function()
--   return {
--     'michaelb/sniprun',
--     build = 'bash ./install.sh',
--     config = function()
--       local status_ok, sniprun = pcall(require, 'sniprun')
--       if not status_ok then
--         return
--       end
--
--       sniprun.setup({
--         -- selected_interpreters = {}, --# use those instead of the default for the current filetype
--         -- repl_enable = {}, --# enable REPL-like behavior for the given interpreters
--         -- repl_disable = {}, --# disable REPL-like behavior for the given interpreters
--
--         -- interpreter_options = { --# interpreter-specific options, see docs / :SnipInfo <name>
--
--         --   --# use the interpreter name as key
--         --   GFM_original = {
--         --     use_on_filetypes = { "markdown.pandoc" }, --# the 'use_on_filetypes' configuration key is
--         --     --# available for every interpreter
--         --   },
--         --   Python3_original = {
--         --     error_truncate = "auto", --# Truncate runtime errors 'long', 'short' or 'auto'
--         --     --# the hint is available for every interpreter
--         --     --# but may not be always respected
--         --   },
--         -- },
--
--         --# you can combo different display modes as desired
--         display = {
--           'Classic', --# display results in the command-line  area
--           -- "VirtualTextOk", --# display ok results as virtual text (multiline is shortened)
--
--           -- "VirtualTextErr", --# display error results as virtual text
--           -- "TempFloatingWindow", --# display results in a floating window
--           -- "LongTempFloatingWindow", --# same as above, but only long results. To use with VirtualText__
--           -- "Terminal", --# display results in a vertical split
--           -- "TerminalWithCode", --# display results and code history in a vertical split
--           -- "NvimNotify",              --# display with the nvim-notify plugin
--           -- "Api"                      --# return output to a programming interface
--         },
--
--         display_options = {
--           terminal_width = 45, --# change the terminal display option width
--           notification_timeout = 5, --# timeout for nvim_notify output
--         },
--
--         --# You can use the same keys to customize whether a sniprun producing
--         --# no output should display nothing or '(no output)'
--         show_no_output = {
--           'Classic',
--           'TempFloatingWindow', --# implies LongTempFloatingWindow, which has no effect on its own
--         },
--
--         --# customize highlight groups (setting this overrides colorscheme)
--         snipruncolors = {
--           SniprunVirtualTextOk = {
--             bg = '#66eeff',
--             fg = '#000000',
--             ctermbg = 'Cyan',
--             cterfg = 'Black',
--           },
--           SniprunFloatingWinOk = { fg = '#66eeff', ctermfg = 'Cyan' },
--           SniprunVirtualTextErr = {
--             bg = '#881515',
--             fg = '#000000',
--             ctermbg = 'DarkRed',
--             cterfg = 'Black',
--           },
--           SniprunFloatingWinErr = { fg = '#881515', ctermfg = 'DarkRed' },
--         },
--
--         --# miscellaneous compatibility/adjustement settings
--         inline_messages = 0, --# inline_message (0/1) is a one-line way to display messages
--         --# to workaround sniprun not being able to display anything
--
--         borders = 'single', --# display borders around floating windows
--         --# possible values are 'none', 'single', 'double', or 'shadow'
--         live_mode_toggle = 'enable', --# live mode toggle, see Usage - Running for more info
--       })
--     end,
--   }
-- end
--
-- return M
return {}
