return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    config = function()
      --local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      vim.lsp.config("*", {
        capabilities = capabilities,
        root_markers = { ".git", ".hg" },
      })
      vim.lsp.config("clangd", {
        root_markers = { ".clang-format", "compile_commands.json", "BLADE_ROOT" },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "cxx", "hpp" },
      })
      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
      vim.lsp.config("basedpyright", {
        settings = {
          basedpyright = {
            analysis = {
              typeCheckingMode = "basic",
            },
          },
        },
      })

      vim.diagnostic.config {
        -- Diagnostic from virtual text to float
        virtual_text = false,
        -- If you want icons for diagnostic errors, you'll need to define them somewhere:
        --[[
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.INFO] = "",
            [vim.diagnostic.severity.HINT] = "󰌵",
          },
        },
        --]]
      }
      -- Use tiny-inline-diagnostic alternative.
      -- vim.cmd [[
      -- augroup DiagnosticFloat
      --   autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false})
      -- augroup END]]

      -- Inlay-hints
      vim.lsp.inlay_hint.enable(true, { 0 })
    end,
    keys = {
      -- builtin lsp diagnostic
      {
        "<leader>gp",
        function()
          vim.diagnostic.jump { count = -1, float = true }
        end,
        desc = "Diagnostic Goto Previous",
      },
      {
        "<leader>gn",
        function()
          vim.diagnostic.jump { count = 1, float = true }
        end,
        desc = "Diagnostic Goto Next",
      },
      -- builtin lsp 函数跳转
      {
        "gd",
        function()
          vim.lsp.buf.definition()
        end,
        desc = "Lsp Definition",
      },
      {
        "gt",
        function()
          vim.lsp.buf.type_definition()
        end,
        desc = "Lsp Type Definition",
      },
      {
        "gi",
        function()
          vim.lsp.buf.implementation()
        end,
        desc = "Lsp Implementation",
      },
      {
        "gr",
        function()
          vim.lsp.buf.references()
        end,
        desc = "Lsp references",
      },
      {
        "<leader>dt",
        function()
          vim.diagnostic.enable(not vim.diagnostic.is_enabled())
        end,
        mode = { "n", "i" },
        desc = "Diagnostic Toggle",
      },
      {
        "<leader>L",
        function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end,
        mode = { "n", "i" },
        desc = "Inlay Hint Toggle",
      },
      --[[
      {
        "<F7>",
        function()
          vim.lsp.buf.format()
        end,
        desc = "Format",
      },
      --]]
    },
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("lspconfig")
      -- mason-lspconfig
      require("mason-lspconfig").setup {
        -- Lsp supported, Formatter not supported.
        ensure_installed = {
          "clangd",
          "lua_ls",
          "basedpyright",
          "cmake",
          "bashls",
          "jsonls",
          "gopls",
          "sqlls",
        },
        -- Whether installed servers should automatically be enabled via `:h vim.lsp.enable()`.
        --
        -- To exclude certain servers from being automatically enabled:
        -- ```lua
        --   automatic_enable = {
        --     exclude = { "rust_analyzer", "ts_ls" }
        --   }
        -- ```
        --
        -- To only enable certain servers to be automatically enabled:
        -- ```lua
        --   automatic_enable = {
        --     "lua_ls",
        --     "vimls"
        --   }
        -- ```
        ---@type boolean | string[] | { exclude: string[] }
        automatic_enable = true,
      }
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        "shfmt",
        "black",
        "isort",
        "sql-formatter",
        "cmakelang",
        "clang-format",
        "stylua",
        "codespell",
        "jq",
        "codelldb",
      },
    },
  },
  {
    "mason-org/mason.nvim",
    event = "VeryLazy",
    config = function()
      require("mason").setup {
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      }
    end,
  },
}
