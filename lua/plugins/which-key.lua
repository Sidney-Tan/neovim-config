return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        "<cmd>lua require('which-key').show({ global = false })<CR>",
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
}
