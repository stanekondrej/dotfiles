return {
	{
		"hrsh7th/nvim-cmp",
		version = false,
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			{
				"onsails/lspkind.nvim",
				opts = {
					symbol_map = {
						text = "󰬴",
						interface = "󰌆",
					},
				},
			},
		},
		opts = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")
			local ls = require("luasnip")

			return {
				formatting = {
					format = lspkind.cmp_format({
						mode = "symbol",
						maxwidth = 50,
						ellipsis_char = "…",
					}),
				},
				snippet = {
					expand = function(args)
						ls.lsp_expand(args.body)
					end,
				},
				window = {
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["C-Space"] = cmp.mapping.complete(),
					["C-e"] = cmp.mapping.abort(),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.confirm({ select = true })
						elseif ls.locally_jumpable(1) then
							ls.jump(1)
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if ls.locally_jumpable(-1) then
							ls.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" })
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "lazydev", group_index = 0 },
				}, {
					{ name = "buffer" },
				}),
			}
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {},
	},
}
