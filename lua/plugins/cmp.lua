--[=[
return {
  {
    "hrsh7th/cmp-nvim-lsp",
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "hrsh7th/cmp-buffer",
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "hrsh7th/cmp-path",
    event = { "InsertEnter", "CmdlineEnter" },
  },
  {
    "hrsh7th/cmp-cmdline",
    event = { "CmdlineEnter" },
  },
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
      local cmp = require("cmp")
      cmp.setup {
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            --vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
            require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          -- documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert {
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          -- { name = 'vsnip' }, -- For vsnip users.
          { name = "luasnip" }, -- For luasnip users.
          -- { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
        }, {
          { name = "buffer" },
        }),
      }

      -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
      -- Set configuration for specific filetype.
      --[[
      cmp.setup.filetype('gitcommit', {
        sources = cmp.config.sources({
          { name = 'git' },
        }, {
          { name = 'buffer' },
        })
      }
      )
      require("cmp_git").setup()
      --]]
      -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        }),
        matching = { disallow_symbol_nonprefix_matching = false },
      })

      -- Set up lspconfig, replace it with config in mason.
      --[[
      local capabilities = require('cmp_nvim_lsp').default_capabilities()
      -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
      require('lspconfig')['clangd'].setup {
        capabilities = capabilities
      }
      require('lspconfig')['lua_ls'].setup {
        capabilities = capabilities
      }
      require('lspconfig')['basedpyright'].setup {
        capabilities = capabilities
      }
      require('lspconfig')['bashls'].setup {
        capabilities = capabilities
      }
      require('lspconfig')['cmake'].setup {
        capabilities = capabilities
      }
      require('lspconfig')['gopls'].setup {
        capabilities = capabilities
      }
      --]]
    end,
    --[[
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      --For luasnip users.
      "L3MON4D3/LuaSnip",
      --"saadparwaiz1/cmp_luasnip",
      --For vsnip users.
      --"hrsh7th/cmp-vsnip",
      --"hrsh7th/vim-vsnip",
      --For ultisnips users.
      --"SirVer/ultisnips",
      --"quangnguyen30192/cmp-nvim-ultisnips",
      --For snippy users.
      --"dcampos/nvim-snippy",
      --"dcampos/cmp-snippy",
    },
    --]]
  },
}
--]=]
return {
  {
    "saghen/blink.cmp",
    -- optional: provides snippets for the snippet source
    dependencies = { "L3MON4D3/LuaSnip" },

    -- use a release tag to download pre-built binaries
    version = "1.*",
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = "enter" },

      appearance = {
        -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = "mono",
      },

      -- (Default) Only show the documentation popup when manually triggered
      completion = { documentation = { auto_show = false } },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      snippets = { preset = "luasnip" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "cmdline" },
        per_filetype = {
          codecompanion = { "codecompanion" },
        },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      --
      -- See the fuzzy documentation for more information
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
}
