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
					"yaml",
					"sql",
					"embedded_template", -- for ERB templates
				},
				auto_install = true,
				highlight = {
					enable = true,
					-- Use vim-haml regex highlighting for Haml since no official Treesitter parser exists
					additional_vim_regex_highlighting = { "haml" },
				},
				textobjects = {
					select = {
						enable = true,
						lookahead = true, -- Automatically jump forward to textobj
						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["al"] = "@loop.outer",
							["il"] = "@loop.inner",
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							["ab"] = "@block.outer",
							["ib"] = "@block.inner",
							["ar"] = "@return.outer",
							["ir"] = "@return.inner",
							["as"] = "@statement.outer",
							["is"] = "@statement.inner",
							["ad"] = "@conditional.outer",
							["id"] = "@conditional.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]m"] = "@function.outer",
							["]]"] = "@class.outer",
							["]l"] = "@loop.outer",
							["]a"] = "@parameter.outer",
							["]d"] = "@conditional.outer",
						},
						goto_next_end = {
							["]M"] = "@function.outer",
							["]["] = "@class.outer",
							["]L"] = "@loop.outer",
							["]A"] = "@parameter.outer",
							["]D"] = "@conditional.outer",
						},
						goto_previous_start = {
							["[m"] = "@function.outer",
							["[["] = "@class.outer",
							["[l"] = "@loop.outer",
							["[a"] = "@parameter.outer",
							["[d"] = "@conditional.outer",
						},
						goto_previous_end = {
							["[M"] = "@function.outer",
							["[]"] = "@class.outer",
							["[L"] = "@loop.outer",
							["[A"] = "@parameter.outer",
							["[D"] = "@conditional.outer",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>na"] = "@parameter.inner",
							["<leader>nf"] = "@function.outer",
						},
						swap_previous = {
							["<leader>pa"] = "@parameter.inner",
							["<leader>pf"] = "@function.outer",
						},
					},
				},
			}
				
		end
}
