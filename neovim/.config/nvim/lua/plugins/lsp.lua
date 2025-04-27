return {
		{"williamboman/mason.nvim", config = true },
		{ 
			"williamboman/mason-lspconfig.nvim",
			config = function()
				require("mason-lspconfig").setup({
					ensure_installed = {
						"ruby_lsp",
						"ts_ls",
					},
				})
			end
		},
		{
			"neovim/nvim-lspconfig",
			config = function()
				local signs = {
					Error = " ",
					Warn = " ",
					Info = " ",
					Hint = "",
				}

				for type, icon in pairs(signs) do
					local hl = "DiagnosticSign" .. type
					vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
				end

				vim.diagnostic.config({
					signs = {
						text = {
							[vim.diagnostic.severity.ERROR] = " ",
							[vim.diagnostic.severity.WARN] = " ",
							[vim.diagnostic.severity.INFO] = " ",
							[vim.diagnostic.severity.HINT] = "",
						},
					},
					virtual_text = false,
					underline = true,
					update_in_insert = false,
					severity_sort = true,
					float = {
						border = "rounded",
					}
				})

				local lspconfig = require("lspconfig")
				lspconfig.ruby_lsp.setup({})
				lspconfig.ts_ls.setup({})

				vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, { desc = "Declaration" })
				vim.keymap.set("n", "<leader>ld", vim.lsp.buf.definition, { desc = "Definition" })
				vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, { desc = "Hover" })
				vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, { desc = "Implementation" })
				vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, { desc = "Signature Help" })
				vim.keymap.set("n", "<leader>lr", vim.lsp.buf.references, { desc = "References" })
				vim.keymap.set("n", "<leader>lc", vim.lsp.buf.rename, { desc = "Rename" })
				vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })
				vim.keymap.set("n", "<leader>lj", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
				vim.keymap.set("n", "<leader>lk", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
			end
		},
}
