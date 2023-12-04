vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.termguicolors = true
local python = io.popen("zsh -c 'which python3'")
if python then
	vim.g.python_host_prog = python:read()
	python:close()
end

require("core.lazy")
require("core.opts")
require("core.keymaps")
-- vim.cmd.colorscheme("ayu")

local neodev = vim.F.npcall(require, "neodev")
if neodev then
	neodev.setup({
		override = function(_, library)
			library.enabled = true
			library.plugins = true
		end,
		lspconfig = true,
		pathStrict = true,
	})
end

local attach_to_buffer = function(output_bufnr, command)
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = vim.api.nvim_create_augroup("runonsave", { clear = true }),
		pattern = "*.py",
		callback = function()
			local currentFile = vim.api.nvim_buf_get_name(0)
			local appendData = function(_, data)
				if data then
					vim.api.nvim_buf_set_lines(output_bufnr, -1, -1, false, data)
				end
			end
			vim.api.nvim_buf_set_lines(output_bufnr, 0, -1, false, { "output:" })
			vim.fn.jobstart({ "python3", currentFile }, {
				stdout_buffered = true,
				on_stdout = appendData,
				on_stderr = appendData,
			})
		end,
	})
end

attach_to_buffer(192, {})

vim.api.nvim_create_user_command("Autorun", function()
	print("auto run...")
	local bufnr = vim.fn.input("Bufnr: ")
	local pattern = vim.fn.input("Pattern: ")
	local command = vim.split(vim.fn.input("Command to run the file: like python"), "")
	attach_to_buffer(tonumber(bufnr), command)
end, {})
