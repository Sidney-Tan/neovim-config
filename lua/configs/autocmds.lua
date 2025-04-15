-- highlights yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank {
      higroup = "IncSearch",
      timeout = 500,
    }
  end,
})


-- <C-]> default invoke vim.lsp.tagfunc(), lsp first, ctags fallback.
-- The following configuration uses only the ctags for <C-]>, 
-- in order to use jumps from cpp files to proto files rather than to pb.h file. 
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.bo[args.buf].tagfunc = ''
  end,
})
--[[
add the following to ~/.ctags, include --
--langdef=PROTO
--langmap=PROTO:.proto
--regex-PROTO=/^[ \t]*message[ \t]+([a-zA-Z0-9_\.]+)/\1/m,message/
--regex-PROTO=/^[ \t]*enum[ \t]+([a-zA-Z0-9_\.]+)/\1/m,enum/
--regex-PROTO=/^[ \t]*(required|repeated|optional)[ \t]+[a-zA-Z0-9_\.]+[ \t]+([a-zA-Z0-9_]+)[ \t]*=/\2/f,field/
--]]


