return {
	{
		"williamboman/mason.nvim",
		priority = 100,
		opts = {},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"arduino_language_server",
				"bashls",
				"clangd",
				"cssls",
				"denols",
				"docker_compose_language_service",
				"dockerls",
				"hls",
				"jsonls",
				"ltex",
				"lua_ls",
				"pyright",
				"rust_analyzer",
				"svelte",
				"tailwindcss",
				"taplo",
				"ts_ls",
				"yamlls",
			},
		},
	},
}
