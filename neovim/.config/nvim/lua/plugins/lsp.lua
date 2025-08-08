
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
			local util = require("lspconfig.util")


			-- Ruby LSP configuration with proper on_new_config hook
			lspconfig.ruby_lsp.setup({
				capabilities = capabilities,
				init_options = {
					formatter = "auto",
				},
				on_new_config = function(new_config, new_root_dir)
					-- Function to check if a gem exists in Gemfile.lock
					local function has_gem_in_lockfile(gem_name, root_dir)
						local lockfile_path = vim.fs.joinpath(root_dir, "Gemfile.lock")
						if vim.fn.filereadable(lockfile_path) == 1 then
							local content = vim.fn.readfile(lockfile_path)
							for _, line in ipairs(content) do
								-- Match "    ruby-lsp (version)" format with proper escaping
								if line:match("^%s*" .. gem_name:gsub("%-", "%%-") .. "%s*%(") then
									return true
								end
							end
						end
						return false
					end

					-- Check if bundle executable is available and Gemfile exists
					local has_bundle = vim.fn.executable("bundle") == 1
					local has_gemfile = vim.fn.filereadable(vim.fs.joinpath(new_root_dir, "Gemfile")) == 1

					-- Determine the appropriate command
					if has_bundle and has_gemfile and has_gem_in_lockfile("ruby-lsp", new_root_dir) then
						new_config.cmd = { "bundle", "exec", "ruby-lsp" }
					else
						new_config.cmd = { "ruby-lsp" }
					end
				end,
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

			-- Command to force Ruby LSP to reconfigure with current directory
			vim.api.nvim_create_user_command("ReconfigureRubyLsp", function()
				-- Stop all ruby_lsp clients
				for _, client in ipairs(vim.lsp.get_clients()) do
					if client.name == "ruby_lsp" then
						client.stop()
					end
				end
				-- Clear any cached configurations
				require("lspconfig").ruby_lsp.manager = nil
				-- Wait then restart
				vim.defer_fn(function()
					vim.cmd("LspStart ruby_lsp")
				end, 1000)
			end, { desc = "Reconfigure Ruby LSP with current project" })

			-- Command to show Ruby LSP status
			vim.api.nvim_create_user_command("RubyLspStatus", function()
				local clients = vim.lsp.get_clients({ name = "ruby_lsp" })
				if #clients == 0 then
					print("Ruby LSP not running")
					return
				end

				local client = clients[1]
				local cmd = client.config.cmd or {}
				local uses_bundler = (#cmd >= 2 and cmd[1] == "bundle" and cmd[2] == "exec")
				local function join_cmd(list)
					local parts = {}
					for _, v in ipairs(list) do table.insert(parts, tostring(v)) end
					return table.concat(parts, " ")
				end

				-- Debug info for troubleshooting
				local root_dir = client.config.root_dir or vim.fn.getcwd()
				local gemfile = root_dir .. "/Gemfile" 
				local lockfile = root_dir .. "/Gemfile.lock"
				local has_gemfile = vim.loop.fs_stat(gemfile) and true or false
				local has_lockfile = vim.loop.fs_stat(lockfile) and true or false
				local has_bundle = (vim.fn.executable("bundle") == 1)

				-- Test lockfile parsing
				local function lockfile_has_gem(lock_path, gem)
					local stat = vim.loop.fs_stat(lock_path)
					if not stat then return false end
					local ok, lines = pcall(vim.fn.readfile, lock_path)
					if not ok then return false end
					
					-- Escape special pattern characters in gem name
					local escaped_gem = gem:gsub("([%-%.%+%[%]%(%)%$%^%%%?%*])", "%%%1")
					
					for _, line in ipairs(lines) do
						-- Match "    ruby-lsp (version)" format (gem definition lines)
						if line:match('^%s+' .. escaped_gem .. '%s*%(') then
							return true
						end
					end
					return false
				end
				local has_ruby_lsp_gem = lockfile_has_gem(lockfile, "ruby-lsp")
				local has_rails_gem = lockfile_has_gem(lockfile, "ruby-lsp-rails")

				print("Ruby LSP is running:")
				print("  - Command: " .. (next(cmd) and join_cmd(cmd) or "(default)"))
				print("  - Using Bundler: " .. (uses_bundler and "✓" or "✗"))
				print("  - Root dir: " .. root_dir)
				print("  - Has Gemfile: " .. (has_gemfile and "✓" or "✗"))
				print("  - Has Gemfile.lock: " .. (has_lockfile and "✓" or "✗"))
				print("  - Bundle executable: " .. (has_bundle and "✓" or "✗"))
				print("  - ruby-lsp in lockfile: " .. (has_ruby_lsp_gem and "✓" or "✗"))
				print("  - Should use bundle: " .. ((has_gemfile and has_bundle and has_ruby_lsp_gem) and "✓" or "✗"))
				print("  - Formatter: " .. (client.config.init_options.formatter or "auto"))
				print("  - All standard LSP features enabled")
				print("  - RuboCop integration: ✓")
				print("  - Rails addon: " .. (has_rails_gem and "✓" or "✗"))
			end, { desc = "Show Ruby LSP status" })
		end,
	},
}
