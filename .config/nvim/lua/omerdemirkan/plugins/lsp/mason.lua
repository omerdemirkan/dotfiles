local mason_status, mason = pcall(require, "mason")

if not mason_status then
	return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig then
	return
end

local mason_null_ls_status, mason_null_ls = pcall(require, "mason-null-ls")
if not mason_null_ls_status then
	return
end

mason.setup()

mason_lspconfig.setup({
	ensure_installed = {
		-- https://github.com/williamboman/mason-lspconfig.nvim#available-lsp-servers
		"lua_ls",
		"tsserver",
		"html",
		"cssls",
		"emmet_ls",
		"tailwindcss",
		"pyright",
		"clangd",
		"cmake",
		"gopls",
		"rust_analyzer",
	},
})

mason_null_ls.setup({
	ensure_installed = {
		-- https://github.com/jay-babu/mason-null-ls.nvim#available-null-ls-sources
		-- "black",
		"eslint_d",
		"flake8",
		"mypy",
		"prettier",
		"stylua",
	},
})
