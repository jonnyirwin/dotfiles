return {
    "catppuccin/nvim",
    name = "catppuccin",
		priority = 1000,
    dependencies = {
      "nvim-lualine/lualine.nvim",
    },
    lazy = false,
    config = function()
      require('catppuccin').setup({
        integrations = {
          barbar = true,
          dadbod_ui = true,
					lsp_trouble = true,
        }
      })

      vim.cmd("colorscheme catppuccin")
    end
  }
