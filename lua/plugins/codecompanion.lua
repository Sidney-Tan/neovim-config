return {
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    opts = {},
  },
  {
    "olimorris/codecompanion.nvim",
    enabled = false,
    opts = {
      strategies = {
        -- Change the default chat adapter
        chat = {
          adapter = "copilot",
          show_model_choices = true,
          model = "Claude Sonnet 4",
        },
        inline = {
          adapter = "copilot",
          show_model_choices = true,
          model = "Claude Sonnet 4",
        },
        cmd = {
          adapter = "copilot",
          show_model_choices = true,
          model = "Claude Sonnet 4",
        },
      },
      opts = {
        -- Set debug logging
        log_level = "DEBUG",
      },
    },
  },
}
