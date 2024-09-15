local has_words_before = function()
	unpack = unpack or table.unpack
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

return {
	{
		"neovim/nvim-lspconfig",
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"b0o/schemastore.nvim",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local default_setup = function(server)
				require("lspconfig")[server].setup({
					capabilities = capabilities,
				})
			end
			require("mason-lspconfig").setup({
				ensure_installed = {},
				handlers = {
					default_setup,
					lua_ls = function()
						require('lspconfig').lua_ls.setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									runtime = {
										version = 'LuaJIT'
									},
									diagnostics = {
										globals = { 'vim' },
									},
									workspace = {
										library = {
											vim.env.VIMRUNTIME,
										},
									},
								},
							},
						})
					end,
					yamlls = function()
						require('lspconfig').yamlls.setup({
							capabilities = capabilities,
							settings = {
								yaml = {
									schemaStore = {
										-- You must disable built-in schemaStore support if you want to use
										-- this plugin and its advanced options like `ignore`.
										enable = false,
										-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
										url = "",
									},
									schemas = require('schemastore').yaml.schemas(),
									validate = { enable = true },
									customTags = {
										"!Cidr", "!Cidr sequence",
										"!And", "!And sequence",
										"!If", "!If sequence",
										"!Not", "!Not sequence",
										"!Equals", "!Equals sequence",
										"!Or", "!Or sequence",
										"!FindInMap", "!FindInMap sequence",
										"!Base64",
										"!Join", "!Join sequence",
										"!Ref",
										"!Sub", "!Sub sequence",
										"!GetAtt", "!GetAZs",
										"!ImportValue", "!ImportValue sequence",
										"!Select", "!Select sequence",
										"!Split", "!Split sequence",
									},
								},
							},
						})
					end,
					emmet_language_server = function()
						require('lspconfig').emmet_language_server.setup({
							capabilities = capabilities,
							filetypes = {
								"css", "eruby", "html", "javascript", "javascriptreact",
								"less", "sass", "scss", "pug", "typescriptreact", "svelte",
								"angular", "vue", "twig"
							},
							options = {
								showSuggestionsAsSnippets = true,
							}
						})
					end
				}
			})
		end
	},
	{
		"hrsh7th/cmp-buffer"
	},
	{
		"hrsh7th/cmp-nvim-lsp"
	},
	{
		"hrsh7th/cmp-path"
	},
	{
		"hrsh7th/cmp-nvim-lsp-signature-help"
	},
	{
		"rafamadriz/friendly-snippets"
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		build = "make install_jsregexp"
	},
	{
		"saadparwaiz1/cmp_luasnip",
	},
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
		},
		opts = function()
			local cmp = require("cmp")
			-- TODO Fix, luasnip is somehow NIL (:
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load({
				exclude = { "html" },
			})
			local defaults = require("cmp.config.default")()
			return {
				snippet = {
					expand = function(args)
						luasnip.lsp_extend(args.body)
					end
				},
				--window = {
					--completion = cmp.config.window.bordered(),
					--documentation = cmp.config.window.bordered(),
				--},
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "luasnip" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
				}),
				sorting = defaults.sorting,
				mapping = cmp.mapping.preset.insert({
					-- Enter key confirms completion item
					["<CR>"] = cmp.mapping.confirm({ select = false }),

					-- Ctrl + space triggers completion menu
					["<C-Space>"] = cmp.mapping({
						i = function()
							if cmp.visible() then
								cmp.abort()
							else
								cmp.complete()
							end
						end,
						c = function()
							if cmp.visible() then
								cmp.close()
							else
								cmp.complete()
							end
						end,
					}),

					-- Tab for snippets
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.confirm({ select = true }) -- Tab confirms completion item when completion is visible
							-- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
							-- that way you will only jump inside the snippet region
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						elseif has_words_before() then
							-- cmp.complete()
						else
							fallback()
						end
					end, { "i", "s" }),

					-- Shift + Tab for snippets
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
			}
		end
	},
	{
		"b0o/schemastore.nvim",
	}
}
