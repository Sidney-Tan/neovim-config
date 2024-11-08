-- 保存本地变量
local map = vim.keymap.set
-- local map = vim.api.nvim_set_keymap
-- diff:
-- vim.keymap.set can use lua functions, and use “remap” for remap
-- vim.api.nvim_set_keymap can't use lua functions, and use “noremap” for remap
-- defalut opt: remap = false, silent = true
-- remap快捷键不递归传递, silent不回显
local opt = { remap = false, silent = true }
-- 快捷键不递归传递, 需要回显
local view_opt = { remap = false, silent = false }

-- functions
-- mouse toggle
local mouse_toggle = function()
  if vim.o.mouse == "" then
    vim.o.mouse = "a"
  else
    vim.o.mouse = ""
  end
end
map("", "<leader>mt", mouse_toggle, { desc = "Mouse Toggle" })


-- line toggle
local line_toggle = function()
  if vim.o.showtabline == 0 and vim.o.laststatus == 0 then
    vim.o.showtabline = 2
    vim.o.laststatus = 2
  else
    vim.o.showtabline = 0
    vim.o.laststatus = 0
  end
end
map("", "<leader>lt", line_toggle, { desc = "Line Toggle" })


-- Normal
map("n", "<F4>", ":e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>",
  { desc = "Header/Implementation Cpp Conversion" })
map("n", "<leader><F4>", ":e %:p:s,.h$,.X123X,:s,.c$,.h,:s,.X123X$,.c,<CR>",
  { desc = "Header/Implementation C Conversion" })
--flush with coc
--map("n", "<F5>", ":Gitsigns toggle_current_line_blame<CR>:set nu!<CR>:set rnu!<CR>:call CocAction('diagnosticToggle')<CR>:CocCommand document.toggleInlayHint<CR>:Gitsigns toggle_signs<CR>:set signcolumn=auto<CR>", opt)
--flush with build-in lsp
map("n", "<Leader>fl",
  ":Gitsigns toggle_current_line_blame<CR>:Gitsigns toggle_signs<CR>::set nu!<CR>:set rnu!<CR><leader>dt,mt<leader>L:set signcolumn=auto<CR>",
  { remap = true, desc = "Flush" })
-- Normal, Visual, Select, Operator-pending
map("", "<F6>", ":tnext<CR>", { desc = "Tnext" })
map("n", "qa", ":qa!<CR>", { desc = "Force Quit" })
map("n", "H", "0", { desc = "Head" })
map("n", "L", "$", { desc = "Tail" })


-- clipboard
map({ "" }, "<leader>y", "\"+y", { desc = "Copy To System Clipboard" })
-- Disable the middle mouse button for pasting
-- mode "" is equal to "n", "v", "o"
map({ "", "c", "i" }, "<MiddleMouse>", "<Nop>")
map({ "", "c", "i" }, "<2-MiddleMouse>", "<Nop>")
map({ "", "c", "i" }, "<3-MiddleMouse>", "<Nop>")
map({ "", "c", "i" }, "<4-MiddleMouse>", "<Nop>")


-- tabnew/edit/close/only
map("n", "<leader>to", ":tabonly<CR>", { silent = false, desc = "Tab Only" })
map("n", "<leader>tc", ":tabclose<CR>", { silent = false, desc = "Tab Close" })
map("n", "<leader>te", ":tabedit <C-R>=expand('%:p:h')<CR>/", { silent = false, desc = "Tab Edit" })
map("n", "<leader>tn", ":$tabnew", { silent = false, desc = "Tab New" })


--[=[
-- Coc/函数跳转
map("n", "gd", "<Plug>(coc-definition)", opt)
map("n", "gD", ":tab sp<CR><Plug>(coc-definition)", opt)
map("n", "gy", "<Plug>(coc-type-definition)", opt)
map("n", "gi", "<Plug>(coc-implementation)", opt)
map("n", "gr", "<Plug>(coc-references)", opt)
-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
-- 在下拉列表pum是可见的时候, 映射Tab和Shift+Tab分别为列表上下移动。
-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
-- local coc_opts = {silent = true, remap = false, expr = true, replace_keycodes = false}
map("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', coc_opts)
map("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], coc_opts)
-- 在下拉列表pum是可见的时候, 回车键映射为Coc的确认，否则还是回车键。
-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
map("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], coc_opts)
-- Use <c-space> to trigger completion
map("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Formatting selected code
-- Use ClangFormat instead of coc, because it's quicklier.
-- map("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
-- map("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
--]=]


-- commenting default support by neovim 0.10
--[[
							*gc* *gc-default*
gc{motion}		Comment or uncomment lines covered by {motion}.

							*gcc* *gcc-default*
gcc			Comment or uncomment [count] lines starting at cursor.

							*v_gc* *v_gc-default*
{Visual}gc		Comment or uncomment the selected line(s).

							*o_gc* *o_gc-default*
gc			Text object for the largest contiguous block of
			non-blank commented lines around the cursor (e.g.
			`gcgc` uncomments a comment block; `dgc` deletes it).
			Works only in Operator-pending mode.
--]]
