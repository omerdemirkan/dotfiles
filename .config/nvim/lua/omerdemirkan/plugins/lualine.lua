local status, lualine = pcall(require, "lualine")

if not status then
	return
end

lualine.setup({
	options = {
		theme = "tokyonight",
		section_separators = { left = " ", right = " " },
		component_separators = { left = "", right = "" },
	},
	sections = {
		lualine_b = {
			"branch",
			"diagnostics",
			{
				"diff",
				colored = false,
			},
		},
	},
})
