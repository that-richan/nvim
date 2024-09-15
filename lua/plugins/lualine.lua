return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = function()
		return {
			options = {
				icons_enabled = true,
				global_status = false,
				always_divide_middle = true,
				theme = "auto",
				ignore_focus = {},
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
				component_separators = { left = '', right = ''},
				section_separators = { left = '', right = ''},
				disabled_filetypes = {
				  statusline = {},
				  winbar = {},
				},
			},
			tabline = {
				lualine_a = { "mode" },
				lualine_b = { "branch" },
				lualine_c = { "filename" },
				lualine_x = { "location" },
			},
			sections = {},
			inactive_sections = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		}
	end
}
