return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    dependencies = { 'saghen/blink.cmp' },
    config = function()
        require("nvim-autopairs").setup({
            check_ts = true, -- Enable treesitter
            ts_config = {
                lua = {'string', 'source'},
                javascript = {'string', 'template_string'},
                java = false,
            },
            disable_filetype = { "TelescopePrompt", "spectre_panel" },
            fast_wrap = {
                map = '<M-e>',
                chars = { '{', '[', '(', '"', "'" },
                pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
                offset = 0,
                end_key = '$',
                keys = 'qwertyuiopzxcvbnmasdfghjkl',
                check_comma = true,
                highlight = 'PmenuSel',
                highlight_grey='LineNr'
            },
        })
        
        -- Integration with blink.cmp
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        local cmp = require('blink.cmp')
        
        -- This needs to be adapted for blink.cmp
        -- You may need to check blink.cmp docs for autopairs integration
    end
}
