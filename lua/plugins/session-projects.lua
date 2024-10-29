return {
    {
        "Shatur/neovim-session-manager",
	},
	{
        "coffebar/neovim-project",
        dependencies = { "Shatur/neovim-session-manager" },
        config = function()
            require("neovim-project").setup({
                projects = {
                    vim.fn.stdpath("config"),
                    -- Home
                    "~/PERSONAL/GitHub/*",
					"~/PERSONAL/BitBucket/*",
					"~/PERSONAL/GitLab/*",
                    -- Work 
                    "~/FASTEST/BitBucket/*",
                    "~/FASTEST/GitHub/*",
					"~/FASTEST/GitLab/*",
                },
                init = function()
                    -- enable saving the state of plugins in the session
                    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
                end,
                dependencies = {
                    { "nvim-lua/plenary.nvim" },
                    { "nvim-telescope/telescope.nvim" },
                    { "Shatur/neovim-session-manager" },
                },
                lazy = false,
                priority = 1000,
            })

            vim.keymap.set("n", "<leader>tp", ":Telescope neovim-project discover<CR>", { noremap = true, silent = true })
            vim.keymap.set("n", "<leader>th", ":Telescope neovim-project history<CR>", { noremap = true, silent = true })
        end
    }
}
