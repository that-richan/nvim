-- TODO Not working (:
return {
	{
		"axelvc/template-string.nvim",
		event = "InsertEnter",
		file_types = { "html", "javascript", "typescript", "typescriptreact", "vue", "svelte", "python", "javascriptreact" },
		jsx_brackets = true,
		remove_template_string = true,
		restore_quotes = {
			normal = '[["]]',
			jsx = '[["]]',
		},
	}
}
