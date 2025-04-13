return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "suketa/nvim-dap-ruby",
  },
  config = function()
    local dap = require('dap')
    local dapui = require('dapui')
    
    -- Ruby setup
    require('dap-ruby').setup()
    
    -- DAP UI setup
    dapui.setup()
    
    -- Automatically open UI when debug session starts
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    
    -- Keymappings (keeping under d prefix)
    vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
    vim.keymap.set("n", "<leader>dc", function() dap.continue() end, { desc = "Continue" })
    vim.keymap.set("n", "<leader>ds", function() dap.step_over() end, { desc = "Step Over" })
    vim.keymap.set("n", "<leader>di", function() dap.step_into() end, { desc = "Step Into" })
    vim.keymap.set("n", "<leader>do", function() dap.step_out() end, { desc = "Step Out" })
  end
}
