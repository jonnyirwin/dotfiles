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
			vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
			vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
			vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
			vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
			vim.api.nvim_set_hl(0, 'Terminal', { bg = 'none' })
			vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
			vim.api.nvim_set_hl(0, 'FoldColumn', { bg = 'none' })
			vim.api.nvim_set_hl(0, 'Folded', { bg = 'none' })
			vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
    end
  }
