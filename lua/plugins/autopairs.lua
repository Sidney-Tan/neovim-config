return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      -- Conflict with coc#pum#confirm, so set map_cr=false.
      -- Don't need to map it even without a coc.
      map_cr = false,
    },
  },
}
