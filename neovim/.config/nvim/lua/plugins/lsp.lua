return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"folke/neodev.nvim",
		},
		build = ":MasonUpdate",
		keys = {
			{ "gD", ":lua vim.lsp.buf.declaration()<CR>", desc = "Go to declaration" },
			{ "gd", ":lua vim.lsp.buf.definition()<CR>", desc = "" },
			{ "K", ":lua vim.lsp.buf.hover()<CR>", desc = "" },
			{ "gI", ":lua vim.lsp.buf.implementation()<CR>", desc = "" },
			{ "gr", ":lua vim.lsp.buf.references()<CR>", desc = "" },
			{ "gl", ":lua vim.diagnostic.open_float()<CR>", desc = "" },
			{ "<leader>lf", ":lua vim.lsp.buf.format{ async = true }<cr>", desc = "" },
			{ "<leader>li", ":LspInfo<cr>", desc = "" },
			{ "<leader>lI", ":LspInstallInfo<cr>", desc = "" },
			{ "<leader>la", ":lua vim.lsp.buf.code_action()<cr>", desc = "" },
			{ "<leader>lj", ":lua vim.diagnostic.goto_next({buffer=0})<cr>", desc = "" },
			{ "<leader>lk", ":lua vim.diagnostic.goto_prev({buffer=0})<cr>", desc = "" },
			{ "<leader>lr", ":lua vim.lsp.buf.rename()<cr>", desc = "" },
			{ "<leader>ls", ":lua vim.lsp.buf.signature_help()<CR>", desc = "" },
			{ "<leader>lq", ":lua vim.diagnostic.setloclist()<CR>", desc = "" },
		},
		config = function()
			require("mason").setup()
			local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lsp_attach = function(client, bufnr) end
			local lspconfig = require("lspconfig")
			require("mason-lspconfig").setup({
				ensure_installed = {
					"tsserver",
				},
			})
			require("mason-lspconfig").setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						on_attach = lsp_attach,
						capabilities = lsp_capabilities,
					})
				end,
			})
			require("neodev").setup()
		end,
	},
}
