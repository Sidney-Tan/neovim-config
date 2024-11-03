return {
  {
    --"sainnhe/gruvbox-material",
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd.colorscheme("gruvbox")
    end,
    -- dependencies = { "rktjmp/lush.nvim" },
  },
  {
    "rktjmp/lush.nvim",
    lazy = true,
  },
}
