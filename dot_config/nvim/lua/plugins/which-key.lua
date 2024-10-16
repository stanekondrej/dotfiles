return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		delay = 500,
	},
	keys = {
		{
			"<leader>w",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "WhichKey",
		},
	},
}
