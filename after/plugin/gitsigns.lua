require("gitsigns").setup({
	signs = {
		add = { text = '│' },
		change = { text = '│' },
		delete = { text = '_' },
		topdelete = { text = '‾' },
		changedelete = { text = '~' },
		untracked = { text = '┆' },
	},
	sign_priority = 1000,
	current_line_blame = true,
	current_line_blame_opts = {
		virt_text = true,
		virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
		delay = 0,
		ignore_whitespace = false,
		virt_text_priority = 100,
	},
	current_line_blame_formatter = '<author> • <author_time:%d. %m. %Y> • <summary>',
})
