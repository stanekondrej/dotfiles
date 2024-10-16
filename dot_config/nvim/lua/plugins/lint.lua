return {
	"mfussenegger/nvim-lint",
	priority = 90,
	config = function()
		vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
			callback = function()
				-- disable eslint on deno projects
				local filename = vim.fn.expand("%")
				if filename:match(".ts$") or filename:match(".js") then
					if not vim.fn.findfile("deno.json") or not vim.fn.findfile("deno.jsonc") then
						require("lint").try_lint("eslint_d")
					end
				end
			end,
		})
	end,
}
