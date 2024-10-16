return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {},
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"dockerfile",
					"html",
					"javascript",
					"json",
					"jsonc",
					"lua",
					"markdown",
					"python",
					"rust",
					"toml",
					"typescript",
					"yaml",
				},
				sync_install = false,
				auto_install = false,
				ignore_install = {},
				highlight = { enable = true },
				use_languagetree = true,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {},
	},
}
