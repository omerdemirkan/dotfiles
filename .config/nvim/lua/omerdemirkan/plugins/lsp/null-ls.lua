local setup, null_ls = pcall(require, "null-ls")
if not setup then
	return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

-- Used to setup format on save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
	sources = {
		-- formatting.black,
		diagnostics.eslint_d,
		diagnostics.flake8,
		--                .with({
		-- 	extra_args = { "--max-line-length", "140" },
		-- }),
		diagnostics.mypy,
		formatting.prettier,
		formatting.stylua,
		-- formatting.black.with({
		-- 	extra_args = { "--line-length", "140", "--skip-string-normalization" },
		-- }),
	},
	-- configure format on save
	on_attach = function(current_client, bufnr)
		if current_client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({
						filter = function(client)
							--  only use null-ls for formatting instead of lsp server
							return client.name == "null-ls"
						end,
						bufnr = bufnr,
						async = false,
					})
				end,
			})
		end
	end,
})
