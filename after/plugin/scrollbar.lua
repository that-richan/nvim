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
