local harpoon_setup, harpoon = pcall(require, "harpoon")
if not harpoon_setup then
	return
end

harpoon.setup({
	-- So marks are remembered per branch
	mark_branch = true,
})
