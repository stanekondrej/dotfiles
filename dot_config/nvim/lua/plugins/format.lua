return {
	"stevearc/conform.nvim",

	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			typescriptreact = { "prettierd" },
			javascriptreact = { "prettierd" },
			svelte = { "prettierd" },
			python = { "black", "isort" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
