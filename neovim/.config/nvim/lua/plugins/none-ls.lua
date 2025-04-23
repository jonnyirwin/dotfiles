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

                null_ls.builtins.formatting.alejandra,
                null_ls.builtins.formatting.markdownlint,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.rubocop,
                null_ls.builtins.formatting.stylua,
            },
        })
    end,
}
