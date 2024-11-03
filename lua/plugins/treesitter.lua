return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = "VeryLazy",
    --lazy = false,
    --priority = 997,
    build = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,

    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = { "c", "cpp", "lua", "python", "json", "sql", "bash", "make", "cmake", "vim", "vimdoc", "query", "markdown", "markdown_inline", "go" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
      })
    end,
  },
}
