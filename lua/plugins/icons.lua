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
      require("icon-picker").setup {
        disable_legacy_commands = true,
      }
    end,
    keys = {
      { "<leader>ip", "<cmd>IconPickerInsert<CR>", mode = { "n", "i" }, desc = "Icon Picker Insert" },
    },
  },

  {
    "nvim-mini/mini.icons",
    lazy = true,
    version = "*",
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    --[[
    config = function()
      require("nvim-web-devicons").set_icon {
        cpp = {
          icon = "𝐂",
          color = "#428850",
          cterm_color = "65",
          name = "Cpp"
        },
        c = {
          icon = "𝐂",
          color = "#428850",
          cterm_color = "65",
          name = "C"
        },
        py = {
          icon = "",
          color = "#3d85c6",
          cterm_color = "65",
          name = "Python"
        },
        lua = {
          icon = "𝙇",
          color = "#76a5af",
          cterm_color = "65",
          name = "Lua"
        },
        txt = {
          icon = "",
          color = "#d0e0e3",
          cterm_color = "65",
          name = "Txt"
        },
        conf = {
          icon = "",
          color = "#d0e0e3",
          cterm_color = "65",
          name = "Conf"
        },
        spec = {
          icon = "",
          color = "#d0e0e3",
          cterm_color = "65",
          name = "Spec"
        },
        ini = {
          icon = "",
          color = "#d0e0e3",
          cterm_color = "65",
          name = "Ini"
        },
        gflags = {
          icon = "",
          color = "#a4c2f4",
          cterm_color = "65",
          name = "Gflags"
        },
        json = {
          icon = "",
          color = "#f6b26b",
          cterm_color = "65",
          name = "Json"
        },
        xml = {
          icon = "𝑋",
          color = "#f1c232",
          cterm_color = "65",
          name = "Xml"
        },
      }
    end,
    --]]
  },
}
