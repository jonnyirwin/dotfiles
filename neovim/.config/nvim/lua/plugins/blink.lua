return {
	  'saghen/blink.cmp',
    dependencies = {
        { 'rafamadriz/friendly-snippets' },
        { 'L3MON4D3/LuaSnip', version = 'v2.*' },
    },
    version = '1.*',
    opts = {
        snippets = { preset = 'luasnip' },
        keymap = { preset = 'default' },
				sources = {
					default = { 'lsp', 'path', 'snippets', 'buffer' },
				},
        completion = { documentation = { auto_show = true } },
        fuzzy = { implementation = 'prefer_rust_with_warning' },
    },
    opts_extend = { "sources.default" },
		config = true,
	}
