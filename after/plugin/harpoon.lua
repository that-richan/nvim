local harpoon = require("harpoon")

harpoon:setup({})

vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
vim.keymap.set("n", "<leader>fe", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<C-+>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-ě>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-š>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-č>", function() harpoon:list():select(4) end)
vim.keymap.set("n", "<C-1>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-2>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-3>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<C-4>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-h>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-l>", function() harpoon:list():next() end)

