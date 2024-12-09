return {
	{
		"williamboman/mason.nvim",
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"cssls",
					--"denols",
					"jsonls",
					"lua_ls",
					"rust_analyzer",
					"tailwindcss",
					"ts_ls",
					"volar",
				},
			})

			local function setup_server(server_name, opts)
				local cmp = require("cmp_nvim_lsp")

				opts.capabilities = cmp.default_capabilities()

				require("lspconfig")[server_name].setup(opts)
			end

			local volar_path = require("mason-registry").get_package("vue-language-server"):get_install_path()
				.. "/node_modules/@vue/language-server"

			require("mason-lspconfig").setup_handlers({
				function(server)
					setup_server(server, {})
				end,

				["lua_ls"] = function()
					setup_server("lua_ls", {
						settings = {
							Lua = {
								workspace = {
									library = vim.api.nvim_get_runtime_file("", true),
								},
								diagnostics = {
									globals = {
										"vim",
									},
								},
							},
						},
					})
				end,

				["ts_ls"] = function()
					setup_server("ts_ls", {
						init_options = {
							plugins = {
								{
									name = "@vue/typescript-plugin",
									location = volar_path,
									languages = { "vue" },
								},
							},
						},
						filetypes = {
							"javascript",
							"typescript",
							"javascriptreact",
							"typescriptreact",
							"vue",
						},
					})
				end,

				-- ["server_name"] = function () <handle a special server> end
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				css = { "prettierd" },
				javascript = { "prettierd" },
				javascriptreact = { "prettierd" },
				lua = { "stylua" },
				rust = { "rustfmt" },
				tex = { "latexindent" },
				typescript = { "prettierd" },
				typescriptreact = { "prettierd" },
				vue = { "prettierd" },
			},
			format_on_save = {
				timeout_ms = 800,
				lsp_format = "fallback",
			},
		},
	},
	{
		"zapling/mason-conform.nvim",
		opts = {},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		keys = {
			{ "gd", vim.lsp.buf.definition },
		},
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		config = function()
			require("lsp_signature").on_attach({
				floating_window = false,
			})
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		build = "make install_jsregexp",
		opts = {},
	},
	{
		"saadparwaiz1/cmp_luasnip",
		lazy = true,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		lazy = true,
	},
	{
		"hrsh7th/cmp-buffer",
		lazy = true,
	},
	{
		"onsails/lspkind.nvim",
		lazy = true,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-3),
					["<C-f>"] = cmp.mapping.scroll_docs(3),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<Tab>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "lazydev", group_index = 0 },
				}, { name = "buffer" }),
				formatting = {
					format = lspkind.cmp_format({
						mode = "text_symbol",
						maxwidth = {
							menu = 50,
						},
					}),
				},
			})
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"Bilal2453/luvit-meta",
		lazy = true,
	},
	{
		"mfussenegger/nvim-lint",
		event = "BufEnter",
		config = function()
			require("lint").linters_by_ft = {
				javascript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescript = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				vue = { "eslint_d" },
			}

			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
