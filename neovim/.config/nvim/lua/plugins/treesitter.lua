return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
		config = function()
			require('nvim-treesitter.configs').setup {
				ensure_installed = { 
					"lua",
					"javascript",
					"typescript",
					"html",
					"css",
					"json",
					"angular",
					"bash",
					"c_sharp",
					"csv",
					"devicetree",
					"dockerfile",
					"elixir",
					"elm",
					"gitignore",
					"haskell",
					"ruby",
					"scss",
					"ssh_config",
					"tsx",
					"xml",
					"yaml"
				},
				auto_install = true,
			}
				
		end
}
