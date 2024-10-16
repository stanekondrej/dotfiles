return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = function()
		local builtin = require("telescope.builtin")

		return {
			{ "<leader>ff", builtin.find_files, desc = "Find a file" },
			{ "<leader>fg", builtin.live_grep,  desc = "Grep files" },
			{ "<leader>fk", builtin.keymaps,    desc = "Search keymaps" },
		}
	end,
	opts = function()
		local pickers = {
			"find_files",
			"live_grep",
			"keymaps",
		}

		local t = {
			pickers = {}
		}

		for _, v in ipairs(pickers) do
			t.pickers[v] = { theme = "dropdown" }
		end

		return t
	end
}
