return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    config = function()
      local dap = require("dap")
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" }
      }
      dap.configurations.c = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = false,
        },
      }
      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = false,
        },
      }
      local repl = require 'dap.repl'
      repl.commands = vim.tbl_extend('force', repl.commands, {
        -- Add a new alias for the existing .exit command
        exit = { 'exit', '.exit', '.bye' },
        -- Add your own commands; run `.echo hello world` to invoke
        -- this function with the text "hello world"
        custom_commands = {
          ['.echo'] = function(text)
            dap.repl.append(text)
          end,
          -- Hook up a new command to an existing dap function
          ['.restart'] = dap.restart,
        },
      })
    end,
    keys = {
      { "<leader>bb", ":! g++ -g %:t<CR>",                               desc = "Compile With g++" },
      { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "Dap Toggle BreakPoint" },
      { "<F5>",       "<cmd>lua require('dap').continue()<CR>",          desc = "Dap Continue" },
      { "<F10>",      "<cmd>lua require('dap').step_over()<CR>",         desc = "Dap Step Over" },
      { "<F12>",      "<cmd>lua require('dap').step_into()<CR>",         desc = "Dap Step Into" },
      { "<leader>do", "<cmd>lua require('dap').step_out()<CR>",          desc = "Dap Step Out" },
      { "<leader>dg", "<cmd>lua require('dap').repl.toggle()<CR>",       desc = "Dap Repl Toggle" },
    },
  },

  {
    "nvim-neotest/nvim-nio",
    lazy = true,
  },

  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
    opts = {
      icons = {
        expanded = "-",
        collapsed = "+",
        circular = "↺"
      },
      mappings = {
        expand = "<CR>",
        open = "o",
        remove = "d"
      },
      layouts = {
        {
          -- You can change the order of elements in the sidebar
          elements = {
            -- Provide IDs as strings or tables with "id" and "size" keys
            {
              id = "scopes",
              size = 0.25, -- Can be float or integer > 1
            },
            { id = "breakpoints", size = 0.25 },
            { id = "stacks",      size = 0.25 },
            { id = "watches",     size = 0.25 },
          },
          size = 40,
          position = "left", -- Can be "left" or "right"
        },
        {
          elements = {
            "repl",
            --"console",
          },
          size = 20,
          position = "bottom", -- Can be "bottom" or "top"
        },
      },
      controls = {
        enabled = false,
      }
    },
    keys = {
      { "<leader>du", "<cmd>lua require('dapui').toggle()<CR>", desc = "Dapui Toggle" },
    },
    --dependencies = {
    --  "nvim-neotest/nvim-nio",
    --  "rcarriga/nvim-dap-ui",
    --}
  },
}
