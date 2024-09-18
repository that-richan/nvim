return {
	{
		"petertriho/nvim-scrollbar",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"kevinhwang91/nvim-hlslens",
		},
		config = function()
			require("scrollbar").setup({
				excluded_filetypes = {
					"cmp_docs",
					"cmp_menu",
					"noice",
					"prompt",
					"TelescopePrompt",
					"NvimTree",
				},
			})

			require("scrollbar.handlers.gitsigns").setup()
			require("scrollbar.handlers.search").setup() -- TODO Doesn't work
		end
	}
}
