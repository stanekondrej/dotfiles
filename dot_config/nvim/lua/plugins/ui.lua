return {
	{
		"j-hui/fidget.nvim",
		opts = {
			notification = {
				window = {
					winblend = 0,
				},
			},
		},
	},
	{
		"folke/trouble.nvim",
		opts = {},
		cmd = "Trouble",
		keys = {
			{
				"<C-;>",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Toggle diagnostics",
			},
		},
	},
}
