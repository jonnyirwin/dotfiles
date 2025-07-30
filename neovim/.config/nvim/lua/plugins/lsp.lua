
-- Fully disable RuboCop LSP client by removing all filetypes
pcall(function()
	require("lspconfig").rubocop.setup({ filetypes = {} })
end)

return {
	{ "williamboman/mason.nvim", config = true },
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"ruby_lsp",
					"ts_ls",
				},
				automatic_installation = false,
			})
		end,
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
				},
			})

			-- Setup capabilities for blink.cmp
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local lspconfig = require("lspconfig")


			lspconfig.ruby_lsp.setup({
				capabilities = capabilities,
				init_options = {
					formatter = "auto",
				},
				on_attach = function(client, bufnr)
					-- Enable completion triggered by <c-x><c-o>
					vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

					-- Ruby-specific keybindings
					local bufopts = { noremap = true, silent = true, buffer = bufnr }
					vim.keymap.set("n", "<leader>lf", vim.lsp.buf.format, bufopts)
				end,
			})
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})

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

			-- Type hierarchy (experimental feature)
			vim.keymap.set("n", "<leader>lt", function()
				require("telescope.builtin").lsp_type_definitions()
			end, { desc = "Type Hierarchy" })

			-- Inlay hints toggle
			vim.keymap.set("n", "<leader>lH", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
			end, { desc = "Toggle Inlay Hints" })

			-- Additional diagnostic viewing options
			vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, { desc = "Show diagnostic popup" })
			vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "Add diagnostics to location list" })
			vim.keymap.set("n", "<leader>lQ", vim.diagnostic.setqflist, { desc = "Add diagnostics to quickfix list" })

			-- Toggle virtual text
			vim.keymap.set("n", "<leader>lv", function()
				vim.diagnostic.config({
					virtual_text = not vim.diagnostic.config().virtual_text,
				})
				print("Virtual text: " .. (vim.diagnostic.config().virtual_text and "enabled" or "disabled"))
			end, { desc = "Toggle virtual text" })

			-- Command to restart Ruby LSP if multiple clients get started
			vim.api.nvim_create_user_command("RestartRubyLsp", function()
				-- Stop all ruby_lsp clients
				for _, client in ipairs(vim.lsp.get_clients()) do
					if client.name == "ruby_lsp" then
						client.stop()
					end
				end
				-- Wait a moment then restart
				vim.defer_fn(function()
					vim.cmd("LspStart ruby_lsp")
				end, 500)
			end, { desc = "Restart Ruby LSP (stops duplicates)" })

			-- Command to show Ruby LSP status
			vim.api.nvim_create_user_command("RubyLspStatus", function()
				local clients = vim.lsp.get_clients({ name = "ruby_lsp" })
				if #clients == 0 then
					print("Ruby LSP not running")
					return
				end

				local client = clients[1]
				print("Ruby LSP is running:")
				print("  - Formatter: " .. (client.config.init_options.formatter or "auto"))
				print("  - All standard LSP features enabled")
				print("  - RuboCop integration: ✓")
				print("  - Rails addon: " .. (vim.fn.executable("ruby-lsp-rails") == 1 and "✓" or "✗"))
			end, { desc = "Show Ruby LSP status" })
		end,
	},
}
