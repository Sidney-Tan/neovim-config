return {
  {
    "stevearc/dressing.nvim",
    lazy = true,
  },

  {
    "ziontee113/icon-picker.nvim",
    lazy = true,
    dependencies = { "stevearc/dressing.nvim" },
    config = function()
      require("icon-picker").setup({
        disable_legacy_commands = true,
      })
    end,
    keys = {
      { "<leader>ip", "<cmd>IconPickerInsert<CR>", mode = { "n", "i" }, desc = "Icon Picker Insert" },
    },
  },
}
