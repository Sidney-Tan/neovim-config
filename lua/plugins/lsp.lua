return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    keys = {
      -- builtin lsp diagnostic
      { "<leader>gp", function() vim.diagnostic.goto_prev() end,                                     desc = "Diagnostic Goto Previous" },
      { "<leader>gn", function() vim.diagnostic.goto_next() end,                                     desc = "Diagnostic Goto Next" },
      -- builtin lsp 函数跳转
      { "gd",         function() vim.lsp.buf.definition() end,                                       desc = "Lsp Definition" },
      { "gt",         function() vim.lsp.buf.type_definition() end,                                  desc = "Lsp Type Definition" },
      { "gi",         function() vim.lsp.buf.implementation() end,                                   desc = "Lsp Implementation" },
      { "gr",         function() vim.lsp.buf.references() end,                                       desc = "Lsp references" },
      { "<leader>dt", function() vim.diagnostic.enable(not vim.diagnostic.is_enabled()) end,         desc = "Diagnostic Toggle" },
      { "<leader>L",  function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end, desc = "Inlay Hint Toggle" },
      --{ "<F7>",       function() vim.lsp.buf.format() end,                                           desc = "Format" },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    config = function()
      require("mason-lspconfig").setup({
        -- Lsp supported, Formatter not supported.
        ensure_installed = {
          "clangd",
          "lua_ls",
          "jedi_language_server",
          "cmake",
          "bashls",
          "jsonls",
          "gopls",
        },
      })
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      require("mason-lspconfig").setup_handlers {
        -- The first entry (without a key) will be the default handler
        -- and will be called for each installed server that doesn't have
        -- a dedicated handler.
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {}
        end,
        -- Next, you can provide a dedicated handler for specific servers.
        -- For example, a handler override for the `rust_analyzer`:
        ["clangd"] = function()
          lspconfig.clangd.setup {
            cmd = {
              "clangd",
              -- "--header-insertion=never",
              -- "--all-scopes-completion",
              -- "--completion-style=detailed",
            },
            filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto", "cxx", "hpp" },
            -- root_pattern(
            -- '.clangd',
            -- '.clang-tidy',
            -- '.clang-format',
            -- 'compile_commands.json',
            -- 'compile_flags.txt',
            -- 'configure.ac',
            -- '.git'
            -- )
            capabilities = capabilities,
          }
        end,
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" }
                }
              }
            },
            capabilities = capabilities,
          }
        end,
        ["jedi_language_server"] = function()
          lspconfig.jedi_language_server.setup {
            capabilities = capabilities,
          }
        end,
        ["cmake"] = function()
          lspconfig.cmake.setup {
            capabilities = capabilities,
          }
        end,
        ["bashls"] = function()
          lspconfig.bashls.setup {
            capabilities = capabilities,
          }
        end,
        ["jsonls"] = function()
          lspconfig.jsonls.setup {
            capabilities = capabilities,
          }
        end,
        ["gopls"] = function()
          lspconfig.gopls.setup {
            capabilities = capabilities,
          }
        end,
      }
      vim.diagnostic.config({ virtual_text = false })
      vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
      -- Inlay-hints
      vim.lsp.inlay_hint.enable(true, { 0 })
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
        "sqlfmt",
        "cmakelang",
        "clang-format",
      },
    },
  },
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  },
}
