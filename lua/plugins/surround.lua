return {
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    version = "*",
    opts = {},
    -- nvim-surround
    --[[
        Old text                    Command         New text
    --------------------------------------------------------------------------------
        hel*lo world                yss"            "hello world"
        surround w*ords             ysiw)           surround (words)
        ma*ke strings               ys$"            ma"ke strings"
        [delete ar*ound me!]        ds]             delete around me!
        'change qu*otes'            cs'"            "change quotes"
    --]]
  },
}
