return {
  {
    "ThePrimeagen/harpoon",
    lazy = true,
    branch = "harpoon2",
    -- dependencies =  { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>a",  "<cmd>lua require('harpoon'):list():add()<CR>",                                    desc = "Mark Add" },
      { "<leader>e",  "<cmd>lua require('harpoon').ui:toggle_quick_menu(require('harpoon'):list())<CR>", desc = "Mark Toggle quick menu" },
      { "<leader>m1", "<cmd>lua require('harpoon'):list():select(1)<CR>",                                desc = "Mark Select 1" },
      { "<leader>m2", "<cmd>lua require('harpoon'):list():select(2)<CR>",                                desc = "Mark Select 2" },
      { "<leader>m3", "<cmd>lua require('harpoon'):list():select(3)<CR>",                                desc = "Mark Select 3" },
      { "<leader>m4", "<cmd>lua require('harpoon'):list():select(4)<CR>",                                desc = "Mark Select 4" },
      -- Toggle previous & next buffers stored within Harpoon list
      { "<leader>mp", "<cmd>lua require('harpoon'):list():prev()<CR>",                                   desc = "Mark Previous" },
      { "<leader>mn", "<cmd>lua require('harpoon'):list():next()<CR>",                                   desc = "Mark Next" },
      { "<leader>th", "<plug>harpoon-telescope",                                                         remap = true,                   desc = "Open harpoon window" },
    },
    config = function()
      local harpoon = require("harpoon")
      local conf = require("telescope.config").values
      local function toggle_telescope(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
            results = file_paths,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
        }):find()
      end
      vim.keymap.set("n", "<plug>harpoon-telescope", function() toggle_telescope(harpoon:list()) end,
        { desc = "Open harpoon window" })
    end,
  },
  -- build-in marks
  -- `m + lowercase letter, add mark in the buffer
  -- `m + uppercase letter, add mark outside the buffer
  -- g` + letter, jump to mark
  -- `] , jump to last change letter
  -- `} , jump to the end of paragraph
  -- `{ , jump to the start of paragraph
  
  -- PS: other jump commands
  -- g; jump to the older position in change list.
  -- g, jump to the newer position in change list.
  -- ]d, jump to the next diagnostic
  -- [d, jump to the previous diagnostic
  -- ]c, jump to the next gitsign hunk
  -- [c, jump to the previous gitsign hunk
}
