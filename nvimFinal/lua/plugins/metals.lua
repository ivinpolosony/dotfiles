return {
	{
		"scalameta/nvim-metals",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
			"lukas-reineke/lsp-format.nvim",
		},
		ft = { "scala", "sbt", "java" },
		keys = {
			{
				"<leader>me",
				function()
					require("telescope").extensions.metals.commands()
				end,
				desc = "Metals commands",
			},
			{
				"<leader>mc",
				function()
					require("metals").compile_cascade()
				end,
				desc = "Metals compile cascade",
			},
		},
		config = function()
			local metals = require("metals")
			local config = metals.bare_config()

			config.settings = {
				showImplicitArguments = true,
				excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
				serverProperties = { "-Xmx2g" },
				enableSemanticHighlighting = true,
			}
			config.init_options.statusBarProvider = "on"
			-- cmp integration
			config.capabilities = require("cmp_nvim_lsp").default_capabilities()

			local dap = require("dap")
			dap.configurations.scala = {
				{
					type = "scala",
					request = "launch",
					name = "RunOrTest",
					metals = {
						runType = "runOrTestFile",
					},
				},
			}
			dap.listeners.after["event_terminated"]["nvim-metals"] = function()
				-- vim.notify("Tests have finished!")
				dap.repl.open()
			end

			config.on_attach = function(client, bufnr)
				metals.setup_dap()
				require("lsp-format").on_attach(client, bufnr)
			end

			-- Autocmd that will actually be in charge of starting the whole thing
			local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "scala", "sbt", "java" },
				callback = function()
					metals.initialize_or_attach(config)
				end,
				group = nvim_metals_group,
			})

			-- local metals_status = function()
			--     return vim.g['metals_status']
			-- end

			-- require("lualine").setup({
			--     options = {
			--       theme = "auto",
			--       disabled_filetypes = {},
			--     },
			--     sections = {
			--       lualine_c = {
			--         { metals_status, cond = function() return vim.g['metals_status'] ~= nil end }
			--       },
			--       lualine_x = {
			--         { "filetype", icon_only = true },
			--               "fileformat",
			--               "filesize",
			--           },
			--       lualine_y = {'progress'},
			--       lualine_z = {'location'}
			--     }
			--   })
		end,
	},
}
