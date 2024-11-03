return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    -- dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>", mode = "n", desc = "Telescope Find Files" },
      { "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>",  mode = "n", desc = "Telescope Live Grep" },
      { "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>",    mode = "n", desc = "Telescope Buffers" },
      { "<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<CR>",   mode = "n", desc = "Telescope Old Files" },
      { "<leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>",  mode = "n", desc = "Telescope Help Tags" },
      { "<leader>ff", "<cmd>lua require('telescope.builtin').marks()<CR>",      mode = "n", desc = "Telescope Marks" },
      { "<leader>fs", "<cmd>lua require('telescope.builtin').git_status()<CR>", mode = "n", desc = "Telescope Git Status" },
      { "<leader>tl", "<cmd>Telescope<CR>",                                     mode = "n", desc = "Telescope" },
    },
  },
}
