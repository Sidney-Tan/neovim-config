return {
  {
    "romgrk/barbar.nvim",
    lazy = false,
    priority = 998,
    init = function()
      vim.g.barbar_auto_setup = false -- disable auto-setup
    end,
    opts = {


      -- WARN: do not copy everything below into your config!
      --       It is just an example of what configuration options there are.
      --       The defaults are suitable for most people.

      -- Enable/disable animations
      animation = true,

      -- Enable/disable auto-hiding the tab bar when there is a single buffer
      auto_hide = false,

      -- Enable/disable current/total tabpages indicator (top right corner)
      tabpages = true,

      -- Enables/disable clickable tabs
      --  - left-click: go to buffer
      --  - middle-click: delete buffer
      clickable = true,

      -- Excludes buffers from the tabline
      -- exclude_ft = {'javascript'},
      -- exclude_name = {'package.json'},

      -- A buffer to this direction will be focused (if it exists) when closing the current buffer.
      -- Valid options are 'left' (the default), 'previous', and 'right'
      focus_on_close = 'left',

      -- Hide inactive buffers and file extensions. Other options are `alternate`, `current`, and `visible`.
      hide = { extensions = false, inactive = false, alternate = true, current = false, visible = true },

      -- Disable highlighting alternate buffers
      highlight_alternate = false,

      -- Disable highlighting file icons in inactive buffers
      highlight_inactive_file_icons = false,

      -- Enable highlighting visible buffers
      highlight_visible = true,

      icons = {
        -- Configure the base icons on the bufferline.
        -- Valid options to display the buffer index and -number are `true`, 'superscript' and 'subscript'
        buffer_index = true,
        buffer_number = false,
        button = '',
        -- Enables / disables diagnostic symbols
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'ﬀ' },
          [vim.diagnostic.severity.WARN] = { enabled = false },
          [vim.diagnostic.severity.INFO] = { enabled = false },
          [vim.diagnostic.severity.HINT] = { enabled = false },
        },
        gitsigns = {
          added = { enabled = true, icon = '+' },
          changed = { enabled = true, icon = '~' },
          deleted = { enabled = true, icon = '-' },
        },
        filetype = {
          -- Sets the icon's highlight group.
          -- If false, will use nvim-web-devicons colors
          custom_colors = false,

          -- Requires `nvim-web-devicons` if `true`
          enabled = true,
        },
        separator = { left = '▎', right = '' },

        -- If true, add an additional separator at the end of the buffer list
        separator_at_end = true,

        -- Configure the icons on the bufferline when modified or pinned.
        -- Supports all the base icon options.
        modified = { button = '●' },
        pinned = { button = '', filename = true },

        -- Use a preconfigured buffer appearance— can be 'default', 'powerline', or 'slanted'
        preset = 'default',

        -- Configure the icons on the bufferline based on the visibility of a buffer.
        -- Supports all the base icon options, plus `modified` and `pinned`.
        alternate = { filetype = { enabled = false } },
        current = { buffer_index = true },
        inactive = { button = '×' },
        visible = { modified = { buffer_number = false } },
      },

      -- If true, new buffers will be inserted at the start/end of the list.
      -- Default is to insert after current buffer.
      insert_at_end = false,
      insert_at_start = false,

      -- Sets the maximum padding width with which to surround each tab
      maximum_padding = 1,

      -- Sets the minimum padding width with which to surround each tab
      minimum_padding = 1,

      -- Sets the maximum buffer name length.
      maximum_length = 30,

      -- Sets the minimum buffer name length.
      minimum_length = 0,

      -- If set, the letters for each buffer in buffer-pick mode will be
      -- assigned based on their name. Otherwise or in case all letters are
      -- already assigned, the behavior is to assign letters in order of
      -- usability (see order below)
      semantic_letters = true,

      -- Set the filetypes which barbar will offset itself for
      sidebar_filetypes = {
        -- Use the default values: {event = 'BufWinLeave', text = nil}
        NvimTree = true,
        -- Or, specify the text used for the offset:
        undotree = { text = 'undotree' },
        -- Or, specify the event which the sidebar executes when leaving:
        ['neo-tree'] = { event = 'BufWipeout' },
        -- Or, specify both
        Outline = { event = 'BufWinLeave', text = 'symbols-outline' },
      },

      -- New buffer letters are assigned in this order. This order is
      -- optimal for the qwerty keyboard layout but might need adjustment
      -- for other layouts.
      letters = 'asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP',

      -- Sets the name of unnamed buffers. By default format is "[Buffer X]"
      -- where X is the buffer number. But only a static string is accepted here.
      no_name_title = nil,
    },

    keys = {
      { "<leader>be",  "<cmd>lua require('telescope.builtin').find_files()<CR>", mode = "n", desc = "Telescope Find Files" },
      { "<leader>be",  ":e <C-R>=expand('%:p:h')<CR>/",                          mode = "n", silent = false,               desc = "Buffer Edit" },
      { "<leader>pin", "<Cmd>BufferPin<CR>",                                     mode = "n", desc = "BufferPin" },
      { "<leader>bp",  "<Cmd>BufferPrevious<CR>",                                mode = "n", desc = "Buffer Previous" },
      { "<leader>bn",  "<Cmd>BufferNext<CR>",                                    mode = "n", desc = "Buffer Next" },
      { "<leader>bc",  "<Cmd>BufferClose<CR>",                                   mode = "n", desc = "Buffer Close" },
      { "<leader>1",   "<Cmd>BufferGoto 1<CR>",                                  mode = "n", desc = "BufferGoto 1" },
      { "<leader>2",   "<Cmd>BufferGoto 2<CR>",                                  mode = "n", desc = "BufferGoto 2" },
      { "<leader>3",   "<Cmd>BufferGoto 3<CR>",                                  mode = "n", desc = "BufferGoto 3" },
      { "<leader>4",   "<Cmd>BufferGoto 4<CR>",                                  mode = "n", desc = "BufferGoto 4" },
      { "<leader>5",   "<Cmd>BufferGoto 5<CR>",                                  mode = "n", desc = "BufferGoto 5" },
      { "<leader>6",   "<Cmd>BufferGoto 6<CR>",                                  mode = "n", desc = "BufferGoto 6" },
      { "<leader>7",   "<Cmd>BufferGoto 7<CR>",                                  mode = "n", desc = "BufferGoto 7" },
      { "<leader>8",   "<Cmd>BufferGoto 8<CR>",                                  mode = "n", desc = "BufferGoto 8" },
      { "<leader>9",   "<Cmd>BufferGoto 9<CR>",                                  mode = "n", desc = "BufferGoto 9" },
      { "<leader>0",   "<Cmd>BufferLast<CR>",                                    mode = "n", desc = "BufferGoto Last" },
    }
  },
}
