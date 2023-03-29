local tokyonight_status, tokyonight = pcall(require, "tokyonight")

if not tokyonight_status then
	return
end

tokyonight.setup({
	on_colors = function(colors)
		colors["bg_float"] = "#111114"
		colors["bg_statusline"] = "#111114"
		colors["bg_sidebar"] = "#111114"
		colors["bg_popup"] = "#111114"
		colors["bg_dark"] = "#111114"

		colors["bg"] = "#191a1f"

		-- colors["bg_highlight"] = "#272a33"
		--
		-- colors["border"] = "#ffffff"
	end,
	transparent = true,
})

local status, _ = pcall(vim.cmd, "colorscheme tokyonight-night")

if not status then
	print("Color scheme not found!")
	return
end
