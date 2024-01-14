local telescope = require("telescope")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<leader>fp", builtin.oldfiles, {})

vim.keymap.set("n", "<leader>gb", builtin.git_branches, {})
vim.keymap.set("n", "<leader>gs", builtin.git_stash, {})
vim.keymap.set("n", "<leader>gf", builtin.git_status, {})
vim.keymap.set("n", "<leader>gc", builtin.git_commits, {})

telescope.setup({
	pickers = {
		find_files = {
			hidden = true,
		},
	},
})
