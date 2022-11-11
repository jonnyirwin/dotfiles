vim.cmd [[packadd packer.nvim]]

local status_ok, packer = pcall(require, "packer")

if not status_ok then
	return
end

packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
	use 'folke/tokyonight.nvim'
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
	use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'windwp/nvim-autopairs'
	use 'numToStr/Comment.nvim'
	use 'lewis6991/gitsigns.nvim'
	use 'nvim-tree/nvim-tree.lua'
	use 'akinsho/bufferline.nvim'
	use 'aserowy/tmux.nvim'

	-- completion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'saadparwaiz1/cmp_luasnip'
	use 'hrsh7th/cmp-nvim-lsp'

	-- snippets
	use 'L3MON4D3/LuaSnip'
	use 'rafamadriz/friendly-snippets'

	-- LSP
	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig.nvim'
	use 'neovim/nvim-lspconfig'
	use 'jose-elias-alvarez/null-ls.nvim'

	-- Telescope
	use 'nvim-telescope/telescope.nvim'

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
	}
	use 'JoosepAlviste/nvim-ts-context-commentstring'

end)
