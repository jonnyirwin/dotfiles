return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim"
    },
    config = function()

        local null_ls = require("null-ls")
        
        null_ls.setup({
            sources = {
                null_ls.builtins.code_actions.gitsigns,

                null_ls.builtins.completion.luasnip,

                null_ls.builtins.diagnostics.haml_lint,
                null_ls.builtins.diagnostics.markdownlint,
                null_ls.builtins.diagnostics.stylelint,
                -- Removed rubocop diagnostics - handled by Ruby LSP

                null_ls.builtins.formatting.alejandra,
                null_ls.builtins.formatting.markdownlint,
                null_ls.builtins.formatting.prettier,
                -- Removed rubocop formatting - handled by Ruby LSP
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.erb_lint,
            },
        })
    end,
}
