local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- a plugin used by a bunch of other plugins.
	use("nvim-lua/plenary.nvim")

	-- color scheme
	use("folke/tokyonight.nvim")

	-- tmux & split window navigator
	use("christoomey/vim-tmux-navigator")

	-- for commenting.
	use("numtostr/comment.nvim")

	-- nvim tree (file explorer)
	use("nvim-tree/nvim-tree.lua")

	-- icons
	use("kyazdani42/nvim-web-devicons")

	-- status line
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finder
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" })

	-- autocompletion
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")

	-- snippets
	use("l3mon4d3/luasnip")
	use("saadparwaiz1/cmp_luasnip")
	use("rafamadriz/friendly-snippets")

	-- managing and installing lsp servers
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- configuring lsp servers
	use("neovim/nvim-lspconfig")
	use("hrsh7th/cmp-nvim-lsp")
	use("glepnir/lspsaga.nvim")
	use("onsails/lspkind.nvim")
	use("jose-elias-alvarez/typescript.nvim")

	-- Linters and formatters
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- Git signs
	use("lewis6991/gitsigns.nvim")

	-- Git fugitive
	use({
		"tpope/vim-fugitive",
		opt = true,
		cmd = {
			"G",
			"Git",
			"Gdiffsplit",
			"Gvdiffsplit",
			"Gedit",
			"Gsplit",
			"Gread",
			"Gwrite",
			"Ggrep",
			"Glgrep",
			"Gmove",
			"Gdelete",
			"Gremove",
			"Gbrowse",
		},
	})

	-- Harpoon: For when you have a small list of files you
	-- visit often. Is specific to project and git branch.
	use("theprimeagen/harpoon")

	use("tpope/vim-surround")

	-- For github permalinks
	use("ruifm/gitlinker.nvim")

	use("github/copilot.vim")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
