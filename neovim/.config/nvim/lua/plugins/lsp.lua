return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim"
		},
		run = ":MasonUpdate",
		config = function(_, opts)
			require("mason").setup()
			require("mason-lspconfig").setup()
			require("lspconfig").tsserver.setup(opts)
		end
	}
}
