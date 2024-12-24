return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    enabled = true,
    priority = 1000,
    init = function()
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd.colorscheme("gruvbox")
    end,
    opts = {},
    -- dependencies = { "rktjmp/lush.nvim" },
  },
  {
    "rktjmp/lush.nvim",
    lazy = true,
    enabled = false,
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    enabled = false,
    priority = 1000,
    init = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_background = "medium"
      vim.g.gruvbox_material_foreground = "original"
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
}
