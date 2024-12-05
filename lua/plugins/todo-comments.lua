return {
  {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    --dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      { "]t", "<cmd>lua require('todo-comments').jump_next()<cr>", "n", desc = "Next todo comment" },
      { "[t", "<cmd>lua require('todo-comments').jump_prev()<cr>", "n", desc = "Previous todo comment" },
    }
  }
}
