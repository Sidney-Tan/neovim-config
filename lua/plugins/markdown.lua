return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = true,
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    ft = { "markdown", "codecompanion" },
    keys = {
      { "<leader>md", "<cmd>lua require('render-markdown').toggle()<cr>", desc = "Render Markdown Toggle" },
    },
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' }, -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  },
}
