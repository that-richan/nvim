return {
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				no_italic = true,
				no_bold = true,
			})

			vim.cmd("colorscheme catppuccin")
		end
	}
}
