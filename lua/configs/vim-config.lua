vim.api.nvim_command("set path+=~/workspace/ads_serving")
vim.api.nvim_command("set path+=~/workspace/brpc/src")
vim.api.nvim_command("set path+=/usr/include/c++/11/")
vim.api.nvim_command("set path+=/usr/local/include")

vim.api.nvim_command("set tags+=./tags")
vim.api.nvim_command("set tags+=../tags")
vim.api.nvim_command("set tags+=../../tags")
vim.api.nvim_command("set tags+=../../../tags")
vim.api.nvim_command("set tags+=../../../../tags")
vim.api.nvim_command("set tags+=../../../../../tags")

-- 持久化撤销 undo(u) 和 redo(ctrl-r)
vim.api.nvim_command("set undofile")
vim.api.nvim_command("set undodir=~/.nvim/undodir")

-- vim.api.nvim_command("set background=dark")
-- vim.api.nvim_command("colorscheme gruvbox")

-- vim.api.nvim_command("let g:coc_default_semantic_highlight_groups = 1")

-- vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard

-- vim.api.nvim_command("set clipboard+=unnamedplus")
