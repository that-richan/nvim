require("copilot").setup({
	suggestion = {
		enabled = true,
		auto_trigger = true,
		debounce = 0,
		keymap = {
			accept = "<C-A>",
			accept_word = false,
			accept_line = false,
			next = "<M-]>",
			prev = "<M-[>",
			dismiss = "<C-k>",
		},
	},
	filetypes = {
		["*"] = true,
	},
})
