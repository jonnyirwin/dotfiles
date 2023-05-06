return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = {
			"nvim-lua/plenary.nvim"
		},
		config = true,
		keys = function()
			local builtin = require('telescope.builtin')
			return {
				{ '<leader>ff', builtin.find_files, desc = "find files" },
				{ '<leader>fg', builtin.live_grep, desc = "live grep" },
				{ '<leader>fb', builtin.buffers, desc = "buffers" },
				{ '<leader>fh', builtin.help_tags, desc = "help tags" },
			}
		end
	}
}

