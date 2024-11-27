return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      -- Conflict with coc#pum#confirm, so set map_cr=false.
      -- Set mar_cr=true when use build-in lsp
      map_cr = true,
    },
  },
}
