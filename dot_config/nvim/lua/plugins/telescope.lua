return {
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		opts = {},
		keys = {
			{ "<leader>ff", require("telescope.builtin").find_files },
			{ "<leader>fr", require("telescope.builtin").lsp_references },
		},
	},
}
