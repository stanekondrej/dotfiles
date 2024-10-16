return {
	"lervag/vimtex",
	tag = "v2.15",
	ft = "tex",
	config = function()
		vim.g.vimtex_view_method = "zathura"
	end,
	keys = { {
		"<C-t>", "<cmd>VimtexCompileSS<cr>"
	}, }
}
