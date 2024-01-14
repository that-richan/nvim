local actionsPreview = require("actions-preview")
vim.keymap.set({ "v", "n" }, "<leader>qq", actionsPreview.code_actions)

actionsPreview.setup({
	backend = { "telescope" },
})
