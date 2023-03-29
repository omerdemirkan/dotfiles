vim.g.mapleader = " "

local map = vim.keymap.set -- for conciseness

-- To avoid "delete character" to copy to
-- your clipboard
map("n", "x", '"_x"')

-- Split window vertically
map("n", "<leader>sv", "<C-w>v")

-- Split window horizontally
map("n", "<leader>sh", "<C-w>s")

-- Make split windows equal width
map("n", "<leader>se", "<C-w>=")

-- Close current split window
map("n", "<leader>sx", ":close<CR>")

-- Open new tab
map("n", "<leader>to", ":tabnew<CR>")

-- Close current tab
map("n", "<leader>tx", ":tabclose<CR>")

-- Go to next tab
map("n", "<leader>tn", ":tabn<CR>")

-- Go to previous tab
map("n", "<leader>tp", ":tabp<CR>")

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Finder -> files
map("n", "<leader>ff", "<CMD>Telescope find_files<CR>")

-- Finder -> live grep
map("n", "<leader>fl", "<CMD>Telescope live_grep<CR>")

-- Finder -> symbols (document)
map("n", "<leader>fs", "<CMD>Telescope lsp_document_symbols<CR>")

-- Finder -> symbols (workspace)
map("n", "<leader>fS", "<CMD>Telescope lsp_dynamic_workspace_symbols<CR>")

-- Finder -> current string the cursor is on
map("n", "<leader>fy", "<CMD>Telescope grep_string<CR>")

-- Finder -> branches
map("n", "<leader>fb", "<CMD>Telescope git_branches<CR>")

-- Finder
map("n", "<leader>fc", "<CMD>Telescope git_commits<CR>")

-- Find help tags
map("n", "<leader>fh", "<CMD>Telescope help_tags<CR>")

-- Finder -> References
map("n", "<leader>fr", "<CMD>Telescope lsp_references<CR>")

-- Move block around without cut/paste
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Allows cursor to stay in place when moving
-- up and down half a page
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- To get rid of my dependence on these.
-- Use <C-u> and <C-d> instead
map("n", "{", "<nop>")
map("n", "}", "<nop>")

-- An optional paste without copy to clipboard.
map("x", "<leader>p", '"_dP')

map("n", "<leader>bp", ":bprev<cr>")
map("n", "<leader>bn", ":bnext<cr>")

-- Github permalink
vim.api.nvim_set_keymap(
	"n",
	"<leader>ghp",
	'<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
	{ silent = true }
)
vim.api.nvim_set_keymap(
	"v",
	"<leader>ghp",
	'<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
	{}
)

-- Harpoon
local mark_status, mark = pcall(require, "harpoon.mark")
local ui_status, ui = pcall(require, "harpoon.ui")

if mark_status and ui_status then
	-- Marks -> add
	map("n", "<leader>a", mark.add_file)
	-- Marks -> view
	map("n", "<C-e>", ui.toggle_quick_menu)

	map("n", "<leader>1", function()
		ui.nav_file(1)
	end)

	map("n", "<leader>2", function()
		ui.nav_file(2)
	end)

	map("n", "<leader>3", function()
		ui.nav_file(3)
	end)

	map("n", "<leader>4", function()
		ui.nav_file(4)
	end)
end
