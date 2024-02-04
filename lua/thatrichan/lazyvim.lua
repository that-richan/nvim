local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- LSP
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "JoosepAlviste/nvim-ts-context-commentstring" },
	{ "nvim-treesitter/playground" },
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = { check_ts = true } }, -- TODO Inserts pair even when a matching pair already exists...
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{ "rafamadriz/friendly-snippets" },
	{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp", dependencies = { "rafamadriz/friendly-snippets" } },
	{ "olrtg/nvim-emmet" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "b0o/schemastore.nvim" },
	{ "mhartington/formatter.nvim" },
	{ "zbirenbaum/copilot.lua", cmd = "Copilot", event = "InsertEnter" },
	{ "onsails/lspkind.nvim" },
	{ "aznhe21/actions-preview.nvim" },
	{ "RRethy/vim-illuminate" },
	{ "windwp/nvim-ts-autotag" },
	-- Navigation
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "nvim-tree/nvim-web-devicons" },
	{ "nvim-tree/nvim-tree.lua", version = "*", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "Shatur/neovim-session-manager" },
	{ "coffebar/neovim-project" },
	{ 'akinsho/toggleterm.nvim', version = "*", config = true }, -- TODO Keymaps and how to use
	{ "ThePrimeagen/harpoon", branch = "harpoon2", dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" } },
	{ "petertriho/nvim-scrollbar", dependencies = { "lewis6991/gitsigns.nvim" } },
	{ "mbbill/undotree" },
	-- Git
	{ "lewis6991/gitsigns.nvim" },
	{ "tpope/vim-fugitive" },
	{ "sindrets/diffview.nvim" },
	-- Looks
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl" },
	{ "HiPhish/rainbow-delimiters.nvim" },
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "tjdevries/colorbuddy.nvim" },
	{ "2nthony/vitesse.nvim", dependencies = { "tjdevries/colorbuddy.nvim" } },
	{ "NvChad/nvim-colorizer.lua" },
	{ "mawkler/modicator.nvim", dependencies = { "2nthony/vitesse.nvim" } },
	{ "rcarriga/nvim-notify" },
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "kevinhwang91/nvim-hlslens" },
	-- Other
	{ "numToStr/Comment.nvim", opts = {} },
	{ "equalsraf/neovim-gui-shim" },
})
