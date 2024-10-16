return {
	{
		"folke/which-key.nvim",
		keys = {
			{ "gd",   vim.lsp.buf.definition, desc = "Go to definition" },
			{ "<F2>", vim.lsp.buf.rename,     desc = "Rename symbol" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},

		config = function()
			local l = require("lspconfig")

			local cap = require("cmp_nvim_lsp").default_capabilities()

			local servers = {
				"arduino_language_server",
				"bashls",
				"clangd",
				"cssls",
				"docker_compose_language_service",
				"dockerls",
				"gopls",
				"hls",
				"html",
				"jsonls",
				"pyright",
				"rust_analyzer",
				"svelte",
				"tailwindcss",
				"taplo",
				"texlab",
				"yamlls",
			}

			for _, value in pairs(servers) do
				l[value].setup({ capabilities = cap })
			end

			l.ts_ls.setup({
				single_file_support = false,
				root_dir = l.util.root_pattern("package.json"),
			})

			l.denols.setup({
				root_dir = l.util.root_pattern("deno.json", "deno.jsonc"),
			})

			l.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						runtime = {
							version = "LuaJIT",
						},
					},
				},
				capabilities = cap,
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
		dependencies = {
			{ "Bilal2453/luvit-meta", lazy = true },
		},
	},
}
