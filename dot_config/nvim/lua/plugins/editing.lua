return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	{
		name = "rainbow_delimiters",
		url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
	},
}
