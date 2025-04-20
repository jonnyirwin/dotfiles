return {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    opts = function() 
        local dashboard = require'alpha.themes.dashboard'
        local logo = [[
        ██╗   ██╗██╗███████╗██╗   ██╗ █████╗ ██╗         ███████╗████████╗██╗   ██╗██████╗ ██╗ ██████╗ 
        ██║   ██║██║██╔════╝██║   ██║██╔══██╗██║         ██╔════╝╚══██╔══╝██║   ██║██╔══██╗██║██╔═══██╗
        ██║   ██║██║███████╗██║   ██║███████║██║         ███████╗   ██║   ██║   ██║██║  ██║██║██║   ██║
        ╚██╗ ██╔╝██║╚════██║██║   ██║██╔══██║██║         ╚════██║   ██║   ██║   ██║██║  ██║██║██║   ██║
         ╚████╔╝ ██║███████║╚██████╔╝██║  ██║███████╗    ███████║   ██║   ╚██████╔╝██████╔╝██║╚██████╔╝
          ╚═══╝  ╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝    ╚══════╝   ╚═╝    ╚═════╝ ╚═════╝ ╚═╝ ╚═════╝ 
        ]]                                                                                       
        
        dashboard.section.header.val = vim.split(logo, "\n", {})
				dashboard.section.buttons.val = {
				dashboard.button("f", " Find file", ":Telescope find_files <CR>"),
				dashboard.button("r", " Recent files", ":Telescope oldfiles <CR>"),
				dashboard.button("t", " Find text", ":Telescope live_grep <CR>"),
				dashboard.button("c", " Config", ":e ~/.config/nvim/init.lua <CR>"),
				dashboard.button("u", " Update", ":Lazy<CR>"),
				dashboard.button("q", " Quit", ":qa<CR>"),
			}

			for _, button in ipairs(dashboard.section.buttons.val) do
				button.opts.hl = "AlphaButtons"
				button.opts.hl_shortcut = "AlphaShortcut"
			end

			dashboard.section.header.opts.hl = "AlphaHeader"
			dashboard.section.buttons.opts.hl = "AlphaButtons"
			dashboard.section.footer.opts.hl = "Type"
			dashboard.opts.opts.noautocmd = true
			return dashboard
    end,
    config = function (_, dashboard)
        require'alpha'.setup(dashboard.opts)
    end
};
