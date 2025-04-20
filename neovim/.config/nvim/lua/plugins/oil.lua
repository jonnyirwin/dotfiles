return {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
		opts = {
			vim.keymap.set("n", "<leader>e", "<CMD>Oil --float<CR>", { desc = "Open Oil" }),
		},
		lazy = false,
}
