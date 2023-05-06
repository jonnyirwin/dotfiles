return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependenies = {
			"nvim-lua/plenary.nvim",
		},
		opts = function()
			local null_ls = require("null-ls")
			return {
				sources = {
					null_ls.builtins.code_actions.eslint,
					null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.formatting.prettierd,
					null_ls.builtins.formatting.stylua,
				},
			}
		end,
		keys = {
			{ "<leader>pf", ":lua vim.lsp.buf.format()<CR>", desc = "Format" },
		},
	},
}
