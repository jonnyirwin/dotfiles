vim.opt.background = 'dark'

local status_ok, tokyonight = pcall(require, "tokyonight")

if status_ok then
	tokyonight.setup({
		transparent = true,
		style = 'night',
		styles = {
			comments = { italic = true },
			keywords = { italic = true }
		}
	})
	vim.cmd('colorscheme tokyonight')
end

