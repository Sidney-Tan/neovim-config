return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    priority = 999,
    -- dependencies = { "nvim-tree/nvim-web-devicons" }
    opts = {
      options = {
        icons_enabled = true,
        theme = "gruvbox",
        --theme = "gruvbox-material",
        component_separators = { left = "", right = "" },
        --component_separators = { left = '', right = ''},
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = {
          {
            "mode",
            icons_enabled = true, -- Enables the display of icons alongside the component.
            -- Defines the icon to be displayed in front of the component.
            -- Can be string|table
            -- As table it must contain the icon as first entry and can use
            -- color option to custom color the icon. Example:
            -- {'branch', icon = ''} / {'branch', icon = {'', color={fg='green'}}}

            -- icon position can also be set to the right side from table. Example:
            -- {'branch', icon = {'', align='right', color={fg='green'}}}
            icon = nil,

            separator = nil, -- Determines what separator to use for the component.
            -- Note:
            --  When a string is provided it's treated as component_separator.
            --  When a table is provided it's treated as section_separator.
            --  Passing an empty string disables the separator.
            --
            -- These options can be used to set colored separators
            -- around a component.
            --
            -- The options need to be set as such:
            --   separator = { left = '', right = ''}
            --
            -- Where left will be placed on left side of component,
            -- and right will be placed on its right.
            --

            cond = nil, -- Condition function, the component is loaded when the function returns `true`.

            draw_empty = false, -- Whether to draw component even if it's empty.
            -- Might be useful if you want just the separator.

            -- Defines a custom color for the component:
            --
            -- 'highlight_group_name' | { fg = '#rrggbb'|cterm_value(0-255)|'color_name(red)', bg= '#rrggbb', gui='style' } | function
            -- Note:
            --  '|' is synonymous with 'or', meaning a different acceptable format for that placeholder.
            -- color function has to return one of other color types ('highlight_group_name' | { fg = '#rrggbb'|cterm_value(0-255)|'color_name(red)', bg= '#rrggbb', gui='style' })
            -- color functions can be used to have different colors based on state as shown below.
            --
            -- Examples:
            --   color = { fg = '#ffaa88', bg = 'grey', gui='italic,bold' },
            --   color = { fg = 204 }   -- When fg/bg are omitted, they default to the your theme's fg/bg.
            --   color = 'WarningMsg'   -- Highlight groups can also be used.
            --   color = function(section)
            --      return { fg = vim.bo.modified and '#aa3355' or '#33aa88' }
            --   end,
            color = nil, -- The default is your theme's color for that section and mode.

            -- Specify what type a component is, if omitted, lualine will guess it for you.
            --
            -- Available types are:
            --   [format: type_name(example)], mod(branch/filename),
            --   stl(%f/%m), var(g:coc_status/bo:modifiable),
            --   lua_expr(lua expressions), vim_fun(viml function name)
            --
            -- Note:
            -- lua_expr is short for lua-expression and vim_fun is short for vim-function.
            type = nil,

            padding = 1, -- Adds padding to the left and right of components.
            -- Padding can be specified to left or right independently, e.g.:
            --   padding = { left = left_padding, right = right_padding }

            fmt = nil, -- Format function, formats the component's output.
            -- This function receives two arguments:
            -- - string that is going to be displayed and
            --   that can be changed, enhanced and etc.
            -- - context object with information you might
            --   need. E.g. tabnr if used with tabs.
            on_click = nil, -- takes a function that is called when component is clicked with mouse.
            -- the function receives several arguments
            -- - number of clicks in case of multiple clicks
            -- - mouse button used (l(left)/r(right)/m(middle)/...)
            -- - modifiers pressed (s(shift)/c(ctrl)/a(alt)/m(meta)...)
          },
        },
        lualine_b = {
          { "branch" },
          {
            "diff",
            colored = false, -- Displays a colored diff status if set to true
            diff_color = {
              -- Same color values as the general color option can be used here.
              added = "LuaLineDiffAdd", -- Changes the diff's added color
              modified = "LuaLineDiffChange", -- Changes the diff's modified color
              removed = "LuaLineDiffDelete", -- Changes the diff's removed color you
            },
            symbols = { added = "+", modified = "~", removed = "-" }, -- Changes the symbols used by the diff.
            source = nil, -- A function that works as a data source for diff.
            -- It must return a table as such:
            --   { added = add_count, modified = modified_count, removed = removed_count }
            -- or nil on failure. count <= 0 won't be displayed.
          },
          {
            "diagnostics",

            -- Table of diagnostic sources, available sources are:
            --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
            -- or a function that returns a table as such:
            --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
            -- sources = { 'nvim_diagnostic', 'coc' },
            sources = { "nvim_lsp" },

            -- Displays diagnostics for the defined severity types
            sections = { "error", "warn", "info", "hint" },

            diagnostics_color = {
              -- Same values as the general color option can be used here.
              error = "DiagnosticError", -- Changes diagnostics' error color.
              warn = "DiagnosticWarn", -- Changes diagnostics' warn color.
              info = "DiagnosticInfo", -- Changes diagnostics' info color.
              hint = "DiagnosticHint", -- Changes diagnostics' hint color.
            },
            symbols = { error = "E", warn = "W", info = "I", hint = "H" },
            colored = false, -- Displays diagnostics status in color if set to true.
            update_in_insert = false, -- Update diagnostics in insert mode.
            always_visible = false, -- Show diagnostics even if there are none.
          },
        },
        lualine_c = {
          {
            "filename",
            file_status = true, -- Displays file status (readonly status, modified status)
            newfile_status = false, -- Display new file status (new file means no write after created)
            path = 4, -- 0: Just the filename
            -- 1: Relative path
            -- 2: Absolute path
            -- 3: Absolute path, with tilde as the home directory
            -- 4: Filename and parent dir, with tilde as the home directory

            shorting_target = 40, -- Shortens path to leave 40 spaces in the window
            -- for other components. (terrible name, any suggestions?)
            symbols = {
              modified = "[+]", -- Text to show when the file is modified.
              readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
              unnamed = "[No Name]", -- Text to show for unnamed buffers.
              newfile = "[New]", -- Text to show for newly created file before first write
            },
          },
        },
        lualine_x = {
          { "encoding" },
          {
            "fileformat",
            symbols = {
              unix = "", -- e712
              dos = "", -- e70f
              mac = "", -- e711
            },
          },
          {
            "filetype",
            colored = true, -- Displays filetype icon in color if set to true
            icon_only = false, -- Display only an icon for filetype
            icon = { align = "right" }, -- Display filetype icon on the right hand side
            -- icon =    {'X', align='right'}
            -- Icon string ^ in table is ignored in filetype component
          },
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    },
  },
}
