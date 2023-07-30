-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- enable autotagging (w/ nvim-ts-autotag plugin)
	autotag = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		-- https://github.com/nvim-treesitter/nvim-treesitter#supported-languages
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"svelte",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
		"c",
		"python",
		"go",
		"rust",
		"markdown",
		"markdown_inline",
		"yaml",
	},
	-- auto install above language parsers
	auto_install = true,
})
