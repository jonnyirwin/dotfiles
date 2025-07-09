return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "nvim-neotest/nvim-nio",
        { 
            "mfussenegger/nvim-dap",
            dependencies = {
                "suketa/nvim-dap-ruby",
            }
        }
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- Setup DAP UI
        dapui.setup({
            icons = { expanded = "▾", collapsed = "▸" },
            mappings = {
                expand = { "<CR>", "<2-LeftMouse>" },
                open = "o",
                remove = "d",
                edit = "e",
                repl = "r",
                toggle = "t",
            },
            layouts = {
                {
                    elements = {
                        { id = "scopes", size = 0.25 },
                        "breakpoints",
                        "stacks",
                        "watches",
                    },
                    size = 40,
                    position = "left",
                },
                {
                    elements = {
                        "repl",
                        "console",
                    },
                    size = 0.25,
                    position = "bottom",
                },
            },
            floating = {
                max_height = nil,
                max_width = nil,
                border = "single",
                mappings = {
                    close = { "q", "<Esc>" },
                },
            },
            windows = { indent = 1 },
            render = {
                max_type_length = nil,
            }
        })

        -- Setup Ruby DAP
        require("dap-ruby").setup()

        -- Ruby debugging configuration
        dap.configurations.ruby = {
            {
                type = "ruby",
                request = "launch",
                name = "Debug Ruby file",
                program = "${file}",
            },
            {
                type = "ruby",
                request = "launch",
                name = "Debug Rails server",
                program = "bin/rails",
                args = { "server" },
                useBundler = true,
            },
            {
                type = "ruby",
                request = "launch",
                name = "Debug RSpec file",
                program = "bundle",
                args = { "exec", "rspec", "${file}" },
            },
            {
                type = "ruby",
                request = "launch",
                name = "Debug RSpec nearest",
                program = "bundle",
                args = function()
                    local line = vim.fn.line('.')
                    return { "exec", "rspec", "${file}:" .. line }
                end,
            },
        }

        -- Auto open/close DAP UI
        dap.listeners.after.event_initialized["dapui_config"] = function()
            dapui.open()
        end
        dap.listeners.before.event_terminated["dapui_config"] = function()
            dapui.close()
        end
        dap.listeners.before.event_exited["dapui_config"] = function()
            dapui.close()
        end

        -- DAP keybindings
        vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Toggle Breakpoint" })
        vim.keymap.set("n", "<leader>dB", function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, { desc = "Set Conditional Breakpoint" })
        vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
        vim.keymap.set("n", "<leader>ds", dap.step_over, { desc = "Step Over" })
        vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step Into" })
        vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step Out" })
        vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
        vim.keymap.set("n", "<leader>dl", dap.run_last, { desc = "Run Last" })
        vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Terminate" })
        
        -- DAP UI keybindings
        vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle Debug UI" })
        vim.keymap.set("n", "<leader>de", dapui.eval, { desc = "Evaluate Expression" })
        vim.keymap.set("v", "<leader>de", dapui.eval, { desc = "Evaluate Selection" })

        -- Ruby/Rails specific debugging keybindings
        vim.keymap.set("n", "<leader>rd", function()
            -- Debug nearest RSpec test
            local line = vim.fn.line('.')
            dap.run({
                type = "ruby",
                request = "launch",
                name = "Debug RSpec nearest",
                program = "bundle",
                args = { "exec", "rspec", vim.fn.expand("%") .. ":" .. line },
            })
        end, { desc = "Debug nearest RSpec test" })

        vim.keymap.set("n", "<leader>rD", function()
            -- Debug entire RSpec file
            dap.run({
                type = "ruby",
                request = "launch",
                name = "Debug RSpec file",
                program = "bundle",
                args = { "exec", "rspec", vim.fn.expand("%") },
            })
        end, { desc = "Debug RSpec file" })
    end,
}