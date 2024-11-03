return {
  {
    "akinsho/toggleterm.nvim",
    event = "VeryLazy",
    opts = {
      -- 使用F9进行开关
      open_mapping = [[<F9>]],
      -- 打开新终端后自动进入插入模式
      start_in_insert = true,
      direction = 'horizontal',
    },
    keys = {
      { "<leader><F9>", "<cmd>ToggleTerm direction='float'<CR>", mode = { "n", "i" }, desc = "Toggle Term" },
    },
  },
}
