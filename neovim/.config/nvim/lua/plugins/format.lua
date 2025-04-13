-- Formatter and linter configuration

return {
  -- Linting
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      
      lint.linters_by_ft = {
        ruby = { "rubocop" },
        typescript = { "eslint" },
        javascript = { "eslint" },
        typescriptreact = { "eslint" },
        javascriptreact = { "eslint" },
        cs = { "cspell" },  -- Not many great C# linters in nvim-lint
        json = { "jsonlint" },
        python = { "pylint" },
        yaml = { "yamllint" },
        -- Add functional language linters
        haskell = { "hlint" },
        elixir = { "credo" },
      }
      
      -- Set up auto linting
      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          require("lint").try_lint()
        end,
      })
      
      -- Add a keybinding to manually trigger linting
      vim.keymap.set("n", "<leader>l", function()
        require("lint").try_lint()
      end, { desc = "Trigger linting" })
    end,
  },
  
  -- Mason tool installer for automatically installing formatters and linters
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- Formatters
          "prettierd",
          "prettier",
          "stylua",
          "rubocop",
          "csharpier",
          "black",
          "isort",
          "stylish-haskell",
          "elm-format",
          
          -- Linters
          "eslint_d",
          "jsonlint",
          "pylint",
          "yamllint",
          "cspell",
          "hlint",
          "credo",
        },
        auto_update = true,
        run_on_start = true,
      })
    end,
  },
}
