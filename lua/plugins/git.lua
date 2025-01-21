return {
  {
    "lewis6991/gitsigns.nvim",
    event = "VeryLazy",
    opts = {
      signs = {
        --add          = { text = '│' },
        --change       = { text = '│' },
        add = { text = "┃" },
        change = { text = "┃" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
        untracked = { text = "┆" },
      },
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir = {
        follow_files = true,
      },
      auto_attach = true,
      attach_to_untracked = true,
      current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = "--- <abbrev_sha>, <author>, <author_time:%Y-%m-%d> - <summary>",
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000, -- Disable if file is longer than this (in lines)
      preview_config = {
        -- Options passed to nvim_open_win
        border = "single",
        style = "minimal",
        relative = "cursor",
        row = 0,
        col = 1,
      },
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local map = vim.keymap.set

        -- Navigation
        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(function()
            gs.next_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "Gitsigns Next Hunk" })

        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(function()
            gs.prev_hunk()
          end)
          return "<Ignore>"
        end, { expr = true, desc = "GistSigns Prev Hunk" })

        -- Actions
        map("n", "<leader>hs", gs.stage_hunk, { desc = "Gitsigns Stage Hunk" })
        map("n", "<leader>hr", gs.reset_hunk, { desc = "Gitsigns Reset Hunk" })
        map("v", "<leader>hs", function()
          gs.stage_hunk { vim.fn.line("."), vim.fn.line("v") }
        end, { desc = "Gitsigns Stage Hunk" })
        map("v", "<leader>hr", function()
          gs.reset_hunk { vim.fn.line("."), vim.fn.line("v") }
        end, { desc = "Gitsigns Reset Hunk" })
        map("n", "<leader>hS", gs.stage_buffer, { desc = "Gitsigns Stage Buffer" })
        map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Gitsigns Undo Stage Buffer" })
        map("n", "<leader>hR", gs.reset_buffer, { desc = "Gitsigns Reset Buffer" })
        map("n", "<leader>hp", gs.preview_hunk, { desc = "Gitsigns Preview Hunk" })
        map("n", "<leader>hb", function()
          gs.blame_line { full = true }
        end, { desc = "Gitsigns Blame Line" })
        map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "Gitsigns Toggle Current Line Blame" })
        map("n", "<leader>hd", gs.diffthis, { desc = "Gitsigns Diffthis" })
        map("n", "<leader>hD", function()
          gs.diffthis("~")
        end, { desc = "Gitsigns DiffThis~" })
        map("n", "<leader>td", gs.toggle_deleted, { desc = "Gitsigns Toggle Deleted" })

        -- Text object
        map({ "o", "x" }, "ih", "<cmd><C-U>Gitsigns select_hunk<CR>", { desc = "Gitsigns Select Hunk" })
      end,
    },
  },

  {
    "sindrets/diffview.nvim",
    lazy = true,
    keys = {
      { "<leader>git", "<cmd>DiffviewFileHistory<CR>", mode = "n", desc = "Diffview All File" },
      { "<leader>gitc", "<cmd>DiffviewFileHistory<CR>", mode = "n", desc = "Diffview Current File" },
    },
  },
}
