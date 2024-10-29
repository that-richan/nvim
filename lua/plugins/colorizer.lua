return {
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end
	},
	{
		"js-everts/cmp-tailwind-colors",
		config = function()
			require("cmp-tailwind-colors").setup({
				enable_alpha = true,

				format = function(itemColor)
					return {
						fg = itemColor,
						bg = itemColor,
						text = "",
					}
				end
			})
		end
	},
	{
		"themaxmarchuk/tailwindcss-colors.nvim",
		module = "tailwindcss-colors",
		opts = {},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			highlight = {
				pattern = [[.*<(KEYWORDS)\s*]],
			},
			keywords = {
				FIX = {
					icon = " ", -- icon used for the sign, and in search results
					color = "error", -- can be a hex color, or a named color (see below)
					alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
					-- signs = false, -- configure signs for some keywords individually
				},
				TODO = { icon = "󰂺 ", color = "warning" },
				HACK = { icon = " ", color = "warning" },
				WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
				TEST = { icon = "⏲ ", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
			},
		},
	}
}
