return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = "make" }
    },
		config = function()
			local builtin = require('telescope.builtin')	
			vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope: Find Files' })
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope: Live Grep' })
			vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope: Buffers' })
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope: Help Tags' })
		end
}
