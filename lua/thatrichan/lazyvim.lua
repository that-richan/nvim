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
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate", config = function()
		local isWindows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
		if isWindows then
			require('nvim-treesitter.install').compilers = { 'zig' }
		end
		local configs = require("nvim-treesitter.configs")

		configs.setup({
			ensure_installed = { "c", "lua", "typescript", "javascript", "html", "rust" },
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
	end },
	{ "nvim-treesitter/playground" },
	{ "rose-pine/neovim", name = "rose-pine", config = function()
		require("rose-pine").setup({ disable_italics = true })

		vim.cmd.colorscheme("rose-pine")
	end },
	{ "nvim-lua/plenary.nvim" },
	{ "nvim-telescope/telescope.nvim", tag = "0.1.5", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "neovim/nvim-lspconfig" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "rafamadriz/friendly-snippets" },
	{ "L3MON4D3/LuaSnip", version = "v2.*", build = "make install_jsregexp", dependencies = { "rafamadriz/friendly-snippets" } },
	{ "olrtg/nvim-emmet" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "b0o/schemastore.nvim" },
	{ "mhartington/formatter.nvim" },
	{ "nvim-tree/nvim-web-devicons" },
	{ "nvim-tree/nvim-tree.lua", version = "*", lazy = false, dependencies = { "nvim-tree/nvim-web-devicons" } },
	{ "windwp/nvim-autopairs", event = "InsertEnter", opts = { check_ts = true } }, -- TODO Inserts pair even when a matching pair already exists...
	{ "Shatur/neovim-session-manager" },
	{ "coffebar/neovim-project", opts = { -- TODO Bugs out when switching projects (nvim-tree)
		projects = {
			"C:/_FASTEST/*",
			"C:/_DEV_SSD/GitHub/*"
		},
		init = function()
			-- enable saving the state of plugins in the session
			vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
		end,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope.nvim", tag = "0.1.4" },
			{ "Shatur/neovim-session-manager" },
		},
		lazy = false,
		priority = 1000,
	}},
	{ 'akinsho/toggleterm.nvim', version = "*", config = true },
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{ "HiPhish/rainbow-delimiters.nvim" },
})
