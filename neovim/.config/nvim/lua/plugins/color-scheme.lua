return {
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {
			transparent = true,
			style = "night",
			styles = {
				comments = { italic = true },
				keywords = { italic = true }
			}
		},
		config = function(_, opts)
			require("tokyonight").setup(opts)
			vim.cmd([[colorscheme tokyonight]])
		end
	},
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		config = true
	}
}
