-- Completion configuration

return {
  {
    "Saghen/blink.cmp",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local blink = require('blink-cmp')
      local luasnip = require('luasnip')
      
      -- Load friendly-snippets
      require("luasnip.loaders.from_vscode").lazy_load()
      
      -- Configure blink-cmp
      blink.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        
        mapping = {
          ['<C-b>'] = blink.mapping.scroll_docs(-4),
          ['<C-f>'] = blink.mapping.scroll_docs(4),
          ['<C-Space>'] = blink.mapping.complete(),
          ['<C-e>'] = blink.mapping.abort(),
          ['<CR>'] = blink.mapping.confirm({ select = false }),
          
          ["<Tab>"] = function(fallback)
            if blink.visible() then
              blink.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end,
          
          ["<S-Tab>"] = function(fallback)
            if blink.visible() then
              blink.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end,
        },
        
        sources = {
          { name = 'lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        },
        
        ui = {
          border = true,
          doc_width = 50,
          icons = true,
        },
      })
    end
  }
  -- Removed duplicate autopairs and Comment plugins that are already in utilities.lua
}
