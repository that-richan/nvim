-- TODO Add mapping to toggle, to focus current file.
return {
	{
		"antosha417/nvim-lsp-file-operations", -- TODO Does not support Svelte (or the TS LSP doesn't..)
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {},
	},
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	}
}
