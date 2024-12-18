return {
  {
    "L3MON4D3/LuaSnip",
    event = "VeryLazy",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!:).
    build = "make install_jsregexp",
    -- local ls = require("luasnip")
    -- map({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
    -- map({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
    -- map({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})
    --
    -- map({"i", "s"}, "<C-E>", function()
    -- 	if ls.choice_active() then
    -- 		ls.change_choice(1)
    -- 	end
    -- end, {silent = true})
  },
}
