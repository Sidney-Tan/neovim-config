return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
      -- conflict with coc#pum#confirm, so set map_cr=false
      map_cr = false,
    },
  },
}
