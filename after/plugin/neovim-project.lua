local neovim_project = require("neovim-project")

vim.keymap.set("n", "<leader>tp", ":Telescope neovim-project discover<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>th", ":Telescope neovim-project history<CR>", { noremap = true, silent = true })

neovim_project.setup({
	projects = {
		vim.fn.stdpath("config"),
		-- Home 
		"~/PERSONAL/GitHub/*",
		-- Work 
		"~/FASTEST/BitBucket/*",
		"~/FASTEST/GitHub/*",
		"~/FASTEST/Personal/*",
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
})
