return {
  {
    "stevearc/dressing.nvim",
    lazy = true,
  },

  {
    "ziontee113/icon-picker.nvim",
    lazy = true,
    dependency = { "stevearc/dressing.nvim" },
    opts = {
      disable_legacy_commands = true,
    },
    keys = {
      { "<leader>ip", "<cmd>IconPickerInsert<CR>", mode = "i", desc = "Icon Picker Insert" },
    },
  },
}
