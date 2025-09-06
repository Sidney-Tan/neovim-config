return {
  {
    "zbirenbaum/copilot.lua",
    enabled = true,
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = false,
        hide_during_completion = true,
        debounce = 75,
        trigger_on_accept = true,
        keymap = {
          accept = "<M-l>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
        lookahead = 1,
      },
    },
  },

  {
    "olimorris/codecompanion.nvim",
    enabled = true,
    event = "VeryLazy",
    config = function()
      require("codecompanion").setup {
        strategies = {
          -- Change the default chat adapter
          chat = {
            adapter = {
              name = "copilot",
              model = "gemini-2.5-pro",
              --model = "gpt-5",
              --model = "gpt-4.1",
              --model = "claude-sonnet-4",
            },
            keymaps = {
              send = {
                modes = { n = { "<C-s>", "<CR>" }, i = "<C-s>" },
                opts = {},
              },
              close = {
                modes = { n = "<C-c>", i = "<C-c>" },
                opts = {},
              },
              -- Add further custom keymaps here
            },
          },
          inline = {
            adapter = {
              name = "copilot",
              model = "gpt-4.1",
              --model = "gpt-5",
              --model = "gemini-2.5-pro",
              --model = "claude-sonnet-4",
            },
            keymaps = {
              accept_change = {
                modes = { n = "ga" },
                description = "Accept the suggested change",
              },
              reject_change = {
                modes = { n = "gr" },
                description = "Reject the suggested change",
              },
            },
            --[[
              The plugin uses the inline LLM you've specified in your config to determine if the response should:
              replace - replace a visual selection you've made
              add - be added in the current buffer at the cursor position
              before - to be added in the current buffer before the cursor position
              new - be placed in a new buffer
              chat - be placed in a chat buffer
            --]]
          },
          cmd = {
            adapter = {
              name = "copilot",
              model = "gpt-4.1",
              --model = "gpt-5",
              --model = "gemini-2.5-pro",
              --model = "claude-sonnet-4",
            },
          },
        },
        opts = {
          -- Set debug logging
          log_level = "DEBUG",
        },
        display = {
          chat = {
            show_settings = true,
          },
        },
        adapters = {
          http = {
            copilot = function()
              return require("codecompanion.adapters").extend("copilot", {})
            end,
            opts = {
              show_model_choices = true,
            },
          },
        },
      }
      -- Expand 'cc' into 'CodeCompanion' in the command line
      vim.cmd([[cab cc CodeCompanion]])
    end,
    keys = {
      { "<leader>cc", ":CodeCompanion", mode = { "n" }, desc = "CodeCompanion Inline" },
      { "<leader>ct", "<cmd>CodeCompanionChat Toggle<cr>", mode = { "n", "v" }, desc = "CodeCompanionChat Toggle" },
      { "<leader>ca", "<cmd>CodeCompanionChat Add<cr>", mode = { "v" }, desc = "CodeCompanionChat Add" },
      { "<leader>cmd", ":CodeCompanionCmd", mode = { "n" }, desc = "CodeCompanion Cmd" },
      { "<leader>cw", "<cmd>CodeCompanionActions<cr>", mode = { "n", "v" }, desc = "CodeCompanion Actions" },
      { "<leader>cg", "<cmd>CodeCompanion generate code here<cr>", mode = { "n" }, desc = "CodeCompanion Complete" },
      -- ga, Accept an inline edit / select adapter/model in chat buffer.
      -- gr, Reject an inline edit
      -- gy, The fastest way to copy an LLM's code output is with gy. This will yank the nearest codeblock.
      -- gx, to clear the chat buffer's contents
      -- gf, fold any codeblocks in the chat buffer
      -- [[ ]], You can quickly move between responses in the chat buffer using [[ or ]].
      -- @insert_edit_into_file tool, combined with the #buffer variable or /buffer slash command, enables an LLM to modify code in a Neovim buffer. This is especially useful if you do not wish to manually apply an LLM's suggestions yourself. Simply tag it in the chat buffer with @files or @insert_edit_into_file.
    },
    --[[ 
    Slash commands, accessed via /, run commands to insert additional context into the chat buffer:
      /buffer - Insert open buffers
      /fetch - Insert URL contents
      /file - Insert a file
      /quickfix - Insert entries from the quickfix list
      /help - Insert content from help tags
      /now - Insert the current date and time
      /symbols - Insert symbols from a selected file
      /terminal - Insert terminal output
    Variables
      #{buffer}, Shares the current buffer's code. This can also receive parameters
      #{lsp} - Shares LSP information and code for the current buffer
    Agent/Tools
      @{file}, Contains the create_file, file_search, get_changed_files, grep_search, insert_edit_into_file and read_file tools
    --]]
  },

  --[[
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter',
    -- Action	Function	Default Binding
    -- Clear current suggestion, codeium#Clear(),	<C-]>
    -- Next suggestion,	codeium#CycleCompletions(1),	<M-]>
    -- Previous suggestion,	codeium#CycleCompletions(-1),	<M-[>
    -- Insert suggestion,	codeium#Accept(),	<Tab>
    -- Manually trigger suggestion,	codeium#Complete(),	<M-Bslash>
    -- Accept word from suggestion,	codeium#AcceptNextWord(),	<C-k>
    -- Accept line from suggestion,	codeium#AcceptNextLine(),	<C-l>
    keys = {
      { "<leader>cc", "<cmd>CodeiumToggle<CR>", mode = { "n", "i" }, desc = "Codeium Toggle" },
    },
  },
  

  -- Replace codeium with neocodeium.
  {
    "monkoose/neocodeium",
    enabled = false,
    lazy = true,
    --event = "VeryLazy",
    opts = {
      -- If `false`, then would not start codeium server (disabled state)
      -- You can manually enable it at runtime with `:NeoCodeium enable`
      enabled = true,
      -- Path to a custom Codeium server binary (you can download one from:
      -- https://github.com/Exafunction/codeium/releases)
      bin = nil,
      -- When set to `true`, autosuggestions are disabled.
      -- Use `require'neodecodeium'.cycle_or_complete()` to show suggestions manually
      manual = false,
      -- Information about the API server to use
      server = {
        -- API URL to use (for Enterprise mode)
        api_url = nil,
        -- Portal URL to use (for registering a user and downloading the binary)
        portal_url = nil,
      },
      -- Set to `false` to disable showing the number of suggestions label in the line number column
      show_label = true,
      -- Set to `true` to enable suggestions debounce
      debounce = false,
      -- Maximum number of lines parsed from loaded buffers (current buffer always fully parsed)
      -- Set to `0` to disable parsing non-current buffers (may lower suggestion quality)
      -- Set it to `-1` to parse all lines
      max_lines = 10000,
      -- Set to `true` to disable some non-important messages, like "NeoCodeium: server started..."
      silent = true,
      -- Set to a function that returns `true` if a buffer should be enabled
      -- and `false` if the buffer should be disabled
      -- You can still enable disabled by this option buffer with `:NeoCodeium enable_buffer`
      filter = function(bufnr)
        return true
      end,
      -- Set to `false` to disable suggestions in buffers with specific filetypes
      -- You can still enable disabled by this option buffer with `:NeoCodeium enable_buffer`
      filetypes = {
        help = false,
        gitcommit = false,
        gitrebase = false,
        ["."] = false,
      },
      -- List of directories and files to detect workspace root directory for Codeium chat
      root_dir = { ".bzr", ".git", ".hg", ".svn", "_FOSSIL_", "package.json" },
    },
    keys = {
      {
        "<leader><Tab>",
        "<cmd>lua require('neocodeium').accept()<CR>",
        mode = { "i" },
        desc = "Codeium Accept",
      },
      {
        "<C-]>",
        "<cmd>lua require('neocodeium').clear()<CR>",
        mode = { "i" },
        desc = "Codeium Clear",
      },
      {
        "<M-]>",
        "<cmd>lua require('neocodeium').cycle_or_complete(1)<CR>",
        mode = { "i" },
        desc = "Codeium Next",
      },
      {
        "<M-[>",
        "<cmd>lua require('neocodeium').cycle_or_complete(-1)<CR>",
        mode = { "i" },
        desc = "Codeium Previous",
      },
      {
        "<C-k>",
        "<cmd>lua require('neocodeium').accept_word()<CR>",
        mode = { "i" },
        desc = "Codeium Accept Word",
      },
      {
        "<C-l>",
        "<cmd>lua require('neocodeium').accept_line()<CR>",
        mode = { "i" },
        desc = "Codeium Accept Line",
      },
      {
        "<leader>cc",
        "<cmd>NeoCodeium toggle<CR>",
        mode = { "n", "i" },
        desc = "Codeium Toggle",
      },
    },
  },
  --]]
}
