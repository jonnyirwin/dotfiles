return {
    {
        'akinsho/toggleterm.nvim',
        version = "*",
        config = function()
            require("toggleterm").setup({
                size = 20,
                open_mapping = [[<c-\>]],
                hide_numbers = true,
                shade_filetypes = {},
                shade_terminals = true,
                shading_factor = 2,
                start_in_insert = true,
                insert_mappings = true,
                persist_size = true,
                direction = "float",
                close_on_exit = true,
                shell = vim.o.shell,
                float_opts = {
                    border = "curved",
                    winblend = 0,
                    highlights = {
                        border = "Normal",
                        background = "Normal",
                    },
                },
            })

            -- Terminal keybindings
            local Terminal = require('toggleterm.terminal').Terminal

            -- Rails console terminal
            local rails_console = Terminal:new({
                cmd = "rails console",
                dir = "git_dir",
                direction = "float",
                float_opts = {
                    border = "double",
                },
                on_open = function(term)
                    vim.cmd("startinsert!")
                    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
                end,
                on_close = function(term)
                    vim.cmd("startinsert!")
                end,
            })

            -- Rails server terminal
            local rails_server = Terminal:new({
                cmd = "rails server",
                dir = "git_dir",
                direction = "horizontal",
                on_open = function(term)
                    vim.cmd("startinsert!")
                    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
                end,
                on_close = function(term)
                    vim.cmd("startinsert!")
                end,
            })

            -- Functions to toggle terminals
            function _rails_console_toggle()
                rails_console:toggle()
            end

            function _rails_server_toggle()
                rails_server:toggle()
            end

            -- Terminal keybindings
            vim.keymap.set("n", "<leader>xf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Float terminal" })
            vim.keymap.set("n", "<leader>xh", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "Horizontal terminal" })
            vim.keymap.set("n", "<leader>xv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "Vertical terminal" })
            vim.keymap.set("n", "<leader>rc", "<cmd>lua _rails_console_toggle()<CR>", { desc = "Rails console" })
            vim.keymap.set("n", "<leader>rs", "<cmd>lua _rails_server_toggle()<CR>", { desc = "Rails server" })

            -- Terminal mode keybindings
            vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
            vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], { desc = "Navigate left" })
            vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], { desc = "Navigate down" })
            vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], { desc = "Navigate up" })
            vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], { desc = "Navigate right" })
        end,
    },
}
