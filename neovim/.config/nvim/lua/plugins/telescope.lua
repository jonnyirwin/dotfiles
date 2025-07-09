return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = "make" }
    },
		config = function()
			local telescope = require('telescope')
			local builtin = require('telescope.builtin')	

			telescope.setup {
				defaults = {
					file_ignore_patterns = { 
						'node_modules/.*', 
						'%.git/.*',  -- Only ignore .git directory contents, not .gitignore etc
						'%.DS_Store',
						'__pycache__/.*',
						'%.pyc',
					},
					-- Show hidden files by default
					hidden = true,
					vimgrep_arguments = {
						'rg',
						'--color=never',
						'--no-heading',
						'--with-filename',
						'--line-number',
						'--column',
						'--smart-case',
						'--hidden',  -- Include hidden files in grep
					},
				},
				pickers = {
					find_files = {
						hidden = true,
						no_ignore = true,
						-- Follow symbolic links
						follow = true,
						-- Additional find command arguments for better hidden file support
						find_command = { 'rg', '--files', '--hidden', '--glob', '!.git/*' },
					},
					live_grep = {
						additional_args = function()
							return { '--hidden', '--glob', '!.git/*' }
						end,
					},
				},
			}

			-- Enhanced keybindings for file finding
			vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope: Find Files (inc. hidden)' })
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope: Live Grep (inc. hidden)' })
			vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope: Buffers' })
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope: Help Tags' })
			
			-- Additional useful telescope pickers
			vim.keymap.set('n', '<leader>fa', function()
				builtin.find_files({ no_ignore = true, hidden = true })
			end, { desc = 'Telescope: All Files (no gitignore)' })
			
			vim.keymap.set('n', '<leader>fd', function()
				builtin.find_files({ cwd = vim.fn.expand('%:p:h') })
			end, { desc = 'Telescope: Files in current directory' })
		end
}
