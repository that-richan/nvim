-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		html = {
			require("formatter.filetypes.html").prettier,
		},
		css = {
			require("formatter.filetypes.css").prettier,
		},
		json = {
			require("formatter.filetypes.json").prettier,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettier,
		},
		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettier,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettier,
		},
		typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettier,
		},
		markdown = {
			require("formatter.filetypes.markdown").prettier,
		},
		yaml = {
			require("formatter.filetypes.yaml").prettier,
		},
		toml = {
			require("formatter.filetypes.toml").prettier,
		},
		svelte = {
			require("formatter.filetypes.svelte").prettier,
		},
		vue = {
			require("formatter.filetypes.vue").prettier,
		},
		graphql = {
			require("formatter.filetypes.graphql").prettier,
		},

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			-- Currently "sed" command is failing in windows
			-- require("formatter.filetypes.any").remove_trailing_whitespace
			function()
				local save_cursor = vim.fn.getpos(".")
				pcall(function() vim.cmd [[%s/\s\+$//e]] end)
				vim.fn.setpos(".", save_cursor)
			end
		}
	}
})
