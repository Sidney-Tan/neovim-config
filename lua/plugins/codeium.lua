return {
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
  --]]
  -- Replace codeium with neocodeium.
  {
    "monkoose/neocodeium",
    event = "VeryLazy",
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
      filter = function(bufnr) return true end,
      -- Set to `false` to disable suggestions in buffers with specific filetypes
      -- You can still enable disabled by this option buffer with `:NeoCodeium enable_buffer`
      filetypes = {
        help = false,
        gitcommit = false,
        gitrebase = false,
        ["."] = false,
      },
      -- List of directories and files to detect workspace root directory for Codeium chat
      root_dir = { ".bzr", ".git", ".hg", ".svn", "_FOSSIL_", "package.json" }
    },
    keys = {
      { "<leader><Tab>", "<cmd>lua require('neocodeium').accept()<CR>",              mode = { "i" },      desc = "Codeium Accept" },
      { "<C-]>",         "<cmd>lua require('neocodeium').clear()<CR>",               mode = { "i" },      desc = "Codeium Clear" },
      { "<M-]>",         "<cmd>lua require('neocodeium').cycle_or_complete(1)<CR>",  mode = { "i" },      desc = "Codeium Next" },
      { "<M-[>",         "<cmd>lua require('neocodeium').cycle_or_complete(-1)<CR>", mode = { "i" },      desc = "Codeium Previous" },
      { "<C-k>",         "<cmd>lua require('neocodeium').accept_word()<CR>",         mode = { "i" },      desc = "Codeium Accept Word" },
      { "<C-l>",         "<cmd>lua require('neocodeium').accept_line()<CR>",         mode = { "i" },      desc = "Codeium Accept Line" },
      { "<leader>cc",    "<cmd>NeoCodeium toggle<CR>",                               mode = { "n", "i" }, desc = "Codeium Toggle" },
    },
  },
}
