return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip"
		},
		opts = {

		},
		config = function(_, opts)
			require("luasnip").config.setup()
			require("cmp").setup(opts)
		end						
	}
}
