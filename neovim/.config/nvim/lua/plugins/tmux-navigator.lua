return {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
    },
    keys = {
      { "<C-h>", "<cmd>TmuxNavigateLeft<cr>", desc = "Navigate window left" },
      { "<C-j>", "<cmd>TmuxNavigateDown<cr>", desc = "Navigate window down" },
      { "<C-k>", "<cmd>TmuxNavigateUp<cr>", desc = "Navigate window up" },
      { "<C-l>", "<cmd>TmuxNavigateRight<cr>", desc = "Navigate window right" },
    },
  }
