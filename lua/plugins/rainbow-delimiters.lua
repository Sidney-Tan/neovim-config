return {
  {
    "HiPhish/rainbow-delimiters.nvim",
    lazy = true,
    -- This plugin requires the treesitter when neovim is startup.
    -- When I set "BufReadPost" or "lazy=false" in the treesitter settings,
    -- the startup speed of neovim is slower(+100ms) for cpp.
    -- But i still start it.
    enabled = true,
    config = function()
      -- This module contains a number of default definitions
      local rainbow_delimiters = require("rainbow-delimiters")

      ---@type rainbow_delimiters.config
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
        },
        query = {
          [""] = "rainbow-delimiters",
        },
        priority = {
          [""] = 100,
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
}
