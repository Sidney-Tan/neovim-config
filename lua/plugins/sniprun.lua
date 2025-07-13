return {
  {
    "michaelb/sniprun",
    lazy = true,
    branch = "master",
    build = "sh install.sh 1",
    -- do 'sh install.sh 1' if you want to force compile locally
    -- (instead of fetching a binary from the github release). Requires Rust >= 1.65
    opt = {},
    keys = {
      { "<leader>r", "<Plug>SnipRun", mode = { "x" }, desc = "Snip Run" },
      { "<leader>r", "ggVG<Plug>SnipRun", mode = { "n" }, desc = "Snip Run All" },
      { "<leader>sc", "<Plug>SnipClose", mode = { "n", "x" }, desc = "Snip Close" },
    },
  },
}
