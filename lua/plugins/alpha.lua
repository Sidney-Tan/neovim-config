return {
  {
    "goolord/alpha-nvim",
    lazy = false,
    -- dependencies = { "nvim-tree/nvim-web-devicons" }
    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.dashboard")
      dashboard.section.header.val = {
        [[                            .:=====-:..         ..................:-::]],
        [[      鸡你太美        ..... =####*##*+:        ................... ...]],
        [[                     .     .:+===-==:    .    ......................  ]],
        [[                  ... .-==:+%%#=-=++:-:.  ...... .....................]],
        [[                ..   :#%%@%=%@@@%#%@-#@%*:     .......................]],
        [[              ..  .-+%@@@%##%@%%@@%##%@@@@#+--:.    ..................]],
        [[            ..  :=#@@@%#**%@@@@@%+==:.:-=+*#%%%#**+:.  ...............]],
        [[           .  :*@@%#%%**%@@@@%*=.           ..:=*####+. ..............]],
        [[      ....  :*@%+-=+**########+- ........... :---::-=+: ..............]],
        [[....  ..  -*@*-.  =*************. ...........=++==++++: ..............]],
        [[::::.....:+#*. .. -++++**=***+++=: ...........-=+++=-.................]],
        [[:::::::.--.........++==+= :+#*++=+: ..........  ...   ................]],
        [[:::::::::::....... :+====.  :+++==+: .................................]],
        [[::::::::::::::.... :+===+: . .-+++++: ................................]],
        [[.::::::::::::::::..:++++=..... -**+*- ................................]],
        [[                                          __                ]],
        [[             ___     ___    ___   __  __ /\_\    ___ ___    ]],
        [[            / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
        [[           /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
        [[           \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
        [[            \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
      }

      dashboard.section.buttons.val = {
        dashboard.button("fo", "  Recently opened files", ",fo"),
        dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("ff", "  Find file", ",ff"),
        dashboard.button("fg", "  Find word", ",fg"),
        dashboard.button("fh", "󰛵  Help tags", ",fh"),
        dashboard.button("th", "  Jump to bookmarks", ",th"),
        dashboard.button("qa", "✖  Quit NVIM", ":qa<CR>"),
      }
      alpha.setup(dashboard.config)
    end,
    -- other header:
    --[[
        costom_header = {
          '   ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣤⣴⣶⣶⣶⣶⣶⠶⣶⣤⣤⣀⠀⠀⠀⠀⠀⠀ ',
          ' ⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⠁⠀⢀⠈⢿⢀⣀⠀⠹⣿⣿⣿⣦⣄⠀⠀⠀ ',
          ' ⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⠿⠀⠀⣟⡇⢘⣾⣽⠀⠀⡏⠉⠙⢛⣿⣷⡖⠀ ',
          ' ⠀⠀⠀⠀⠀⣾⣿⣿⡿⠿⠷⠶⠤⠙⠒⠀⠒⢻⣿⣿⡷⠋⠀⠴⠞⠋⠁⢙⣿⣄ ',
          ' ⠀⠀⠀⠀⢸⣿⣿⣯⣤⣤⣤⣤⣤⡄⠀⠀⠀⠀⠉⢹⡄⠀⠀⠀⠛⠛⠋⠉⠹⡇ ',
          ' ⠀⠀⠀⠀⢸⣿⣿⠀⠀⠀⣀⣠⣤⣤⣤⣤⣤⣤⣤⣼⣇⣀⣀⣀⣛⣛⣒⣲⢾⡷ ',
          ' ⢀⠤⠒⠒⢼⣿⣿⠶⠞⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠁⠀⣼⠃ ',
          ' ⢮⠀⠀⠀⠀⣿⣿⣆⠀⠀⠻⣿⡿⠛⠉⠉⠁⠀⠉⠉⠛⠿⣿⣿⠟⠁⠀⣼⠃⠀ ',
          ' ⠈⠓⠶⣶⣾⣿⣿⣿⣧⡀⠀⠈⠒⢤⣀⣀⡀⠀⠀⣀⣀⡠⠚⠁⠀⢀⡼⠃⠀⠀ ',
          ' ⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣷⣤⣤⣤⣤⣭⣭⣭⣭⣭⣥⣤⣤⣤⣴⣟⠁    ',
    }
    --]]
  },
}
