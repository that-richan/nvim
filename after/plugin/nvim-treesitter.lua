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
