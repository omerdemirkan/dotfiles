local setup, nvimtree = pcall(require, "nvim-tree")

if not setup then
	return
end

-- Recommended settings from docs
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

nvimtree.setup({
	-- Changing folder arrow icons
	renderer = {
		icons = {
			glyphs = {
				folder = {
					arrow_closed = "", -- arrow when folder is closed
					arrow_open = "", -- arrow when folder is open
				},
			},
		},
	},
	-- disable window_picker for
	-- explorer to work well with
	-- window splits
	actions = {
		open_file = {
			window_picker = {
				enable = false,
			},
		},
	},

	-- Don't ignore files that are in gitignore.
	git = {
		ignore = false,
	},

	view = {
		width = 60,
	},
})
