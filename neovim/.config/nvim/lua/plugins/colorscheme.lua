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

			-- Italic styling
			vim.api.nvim_set_hl(0, 'Comment', { italic = true })
			vim.api.nvim_set_hl(0, '@keyword', { italic = true })
			vim.api.nvim_set_hl(0, '@keyword.conditional', { italic = true })
			vim.api.nvim_set_hl(0, '@keyword.repeat', { italic = true })
			vim.api.nvim_set_hl(0, '@keyword.return', { italic = true })
			vim.api.nvim_set_hl(0, '@keyword.function', { italic = true })
			vim.api.nvim_set_hl(0, '@parameter', { italic = true })
			vim.api.nvim_set_hl(0, '@variable.builtin', { italic = true })
			vim.api.nvim_set_hl(0, '@type.builtin', { italic = true })
    end
  }
