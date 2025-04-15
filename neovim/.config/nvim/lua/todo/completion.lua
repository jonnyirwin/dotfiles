return {
  'saghen/blink.cmp',
  version = '1.1.1',
  dependencies = { 'rafamadriz/friendly-snippets',
		{
			'L3NON4D3/LuaSnip',
			tag = "v2.3.0",
			run = 'make install_jsregexp'
		}
	},
  opts = {
    snippets = { preset = 'luasnip' },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    }
  }
}
