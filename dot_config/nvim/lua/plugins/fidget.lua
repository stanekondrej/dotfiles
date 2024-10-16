return {

	"j-hui/fidget.nvim",
	lazy = false,
	opts = {
		progress = {
			display = {
				render_limit = 5,
				done_ttl = 2,

				done_icon = "",
			},
		},
	},
	keys = {
		{ "<leader>nc", ":Fidget clear<CR>", desc = "Clear active notifications" },
		{ "<leader>nC", ":Fidget clear_history<CR>", desc = "Clear notification history" },
		{ "<leader>nh", ":Fidget history<CR>", desc = "Show notification history" },
		{ "<leader>ns", ":Fidget suppress<CR>", desc = "Toggle suppressing notifications" },
	},
}
