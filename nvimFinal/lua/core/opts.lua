vim.o.clipboard = "unnamedplus"
-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.relativenumber = false
-- Keep signcolumn on by default
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 200
vim.o.timeoutlen = 200

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- A lot of the servers I use won't support document_highlight or codelens,
-- so we use use them in Metals
-- Only highlight if compatible with the language
-- if vim.lsp.buf.document_highlight then
-- 	vim.api.nvim_create_autocmd("CursorHold", {
-- 		callback = vim.lsp.buf.document_highlight,
-- 		buffer = bufnr,
-- 		group = lsp_group,
-- 	})
-- end
vim.api.nvim_create_autocmd("CursorMoved", {
	callback = function()
		vim.lsp.buf.clear_references()
	end,
	buffer = bufnr,
	group = lsp_group,
})
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
	callback = vim.lsp.codelens.refresh,
	buffer = bufnr,
	group = lsp_group,
})
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "dap-repl" },
	callback = function()
		require("dap.ext.autocompl").attach()
	end,
	group = lsp_group,
})
