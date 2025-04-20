return {
    "rcarriga/nvim-dap-ui",
    dependencies = {
        "nvim-neotest/nvim-nio",
        { 
            "mfussenegger/nvim-dap",
            dependencies = {
                "suketa/nvim-dap-ruby",
                config = function()
                    require("dap-ruby").setup()
                end
            }
        }
    }
}