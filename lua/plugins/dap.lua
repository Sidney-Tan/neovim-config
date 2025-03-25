return {
  {
    "mfussenegger/nvim-dap",
    lazy = true,
    config = function()
      local dap = require("dap")
      dap.adapters.codelldb = {
        type = "executable",
        command = "codelldb", -- or if not in $PATH: "/absolute/path/to/codelldb"
        -- On windows you may have to uncomment this:
        -- detached = false,
      }
      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopOnEntry = false,
        },
      }
      dap.configurations.c = dap.configurations.cpp
     --[[
      dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" },
      }
      dap.configurations.cpp = {
        {
          name = "Launch",
          type = "gdb",
          request = "launch",
          program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
          end,
          cwd = "${workspaceFolder}",
          stopAtBeginningOfMainSubprogram = false,
        },
      }
      dap.configurations.c = dap.configurations.cpp
      --]]
      local repl = require("dap.repl")
      repl.commands = vim.tbl_extend("force", repl.commands, {
        -- Add a new alias for the existing .exit command
        exit = { "exit", ".exit", ".bye" },
        -- Add your own commands; run `.echo hello world` to invoke
        -- this function with the text "hello world"
        custom_commands = {
          [".echo"] = function(text)
            dap.repl.append(text)
          end,
          -- Hook up a new command to an existing dap function
          [".restart"] = dap.restart,
        },
      })
    end,
    keys = {
      { "<leader>bb", ":! g++ -g %:t<CR>", desc = "Compile With g++" },
      { "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "Dap Toggle BreakPoint" },
      { "<F5>", "<cmd>lua require('dap').continue()<CR>", desc = "Dap Continue" },
      { "<F10>", "<cmd>lua require('dap').step_over()<CR>", desc = "Dap Step Over" },
      { "<F12>", "<cmd>lua require('dap').step_into()<CR>", desc = "Dap Step Into" },
      { "<leader>do", "<cmd>lua require('dap').step_out()<CR>", desc = "Dap Step Out" },
      { "<leader>dg", "<cmd>lua require('dap').repl.toggle()<CR>", desc = "Dap Repl Toggle" },
      { "<leader>dl", "<cmd>lua require('dap').run_last()<CR>", desc = "Dap Run Last" },
      { "<leader>dc", "<cmd>lua require('dap').terminate()<CR>", desc = "Dap Terminate" },
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
      mappings = {
        edit = "e",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t",
      },
      layouts = {
        {
          -- You can change the order of elements in the sidebar
          elements = {
            -- Provide IDs as strings or tables with "id" and "size" keys
            {
              id = "scopes",
              size = 0.5, -- Can be float or integer > 1
            },
            { id = "breakpoints", size = 0.25 },
            --{ id = "stacks",      size = 0.25 },
            { id = "watches", size = 0.25 },
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
        element = "repl",
        enabled = true,
        icons = {
          disconnect = "",
          pause = "",
          play = "",
          run_last = "",
          step_back = "",
          step_into = "",
          step_out = "",
          step_over = "",
          terminate = "",
        },
      },
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
