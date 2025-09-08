# neovim-config

<a href="https://dotfyle.com/Sidney-Tan/neovim-config"><img src="https://dotfyle.com/Sidney-Tan/neovim-config/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/Sidney-Tan/neovim-config"><img src="https://dotfyle.com/Sidney-Tan/neovim-config/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/Sidney-Tan/neovim-config"><img src="https://dotfyle.com/Sidney-Tan/neovim-config/badges/plugin-manager?style=flat" /></a>

## Install Instructions

 > Install requires Neovim 0.11+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:Sidney-Tan/neovim-config ~/.config/Sidney-Tan/neovim-config
```

Open Neovim with this config:

```sh
NVIM_APPNAME=Sidney-Tan/neovim-config/ nvim
```

Or set it as the global config:
```sh
git clone git@github.com:Sidney-Tan/neovim-config ~/.config/nvim
```

## Plugin Manager

I have switched the plugin manager from **[packer.nvim](https://github.com/wbthomason/packer.nvim)** to **[lazy.nvim](https://github.com/folke/lazy.nvim)**.

**Lazy.nvim** is a modern plugin manager for Neovim.

One of the features that has made the most impact on me:

+ 🔌 Automatic lazy-loading of Lua modules and **lazy-loading** on events, commands, filetypes, and key mappings.

## Colorscheme

My favorite colorscheme is **[gruvbox](https://github.com/ellisonleao/gruvbox.nvim)** or **[gruvbox-material](https://github.com/sainnhe/gruvbox-material)**:

![](https://camo.githubusercontent.com/668e11d96516adbe306407d3b58a0fb22aaffbf98bc1d7edfa086ad17cd2feef/68747470733a2f2f692e706f7374696d672e63632f667933746e4746742f67727576626f782d7468656d65732e706e67)
## Lsp Related

I have switched the lsp support from **[coc](https://github.com/neoclide/coc.nvim)** to **[neovim built-in lsp](https://neovim.io/doc/user/lsp.html)**, with the plugins as follows: 

+ [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
  + It provides basic, default Nvim LSP client configurations for various LSP servers.
+ [mason](https://github.com/williamboman/mason.nvim)
  + Portable package manager for Neovim that runs everywhere Neovim runs.
  + Easily install and manage LSP servers, DAP servers, linters, and formatters.
+ [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)
  + it bridges mason with the nvim-lspconfig plugin - making it easier to use both plugins together.
+ [blink.cmp](https://github.com/Saghen/blink.cmp)
  + A completion engine plugin with support for LSPs and external sources that updates on every keystroke with minimal overhead (0.5-4ms async).
  + It uses an optional custom fuzzy matcher to easily handle 20k+ items.
  + I have switched from **[nvim-cmp](https://github.com/hrsh7th/nvim-cmp)** to **[blink.cmp](https://github.com/Saghen/blink.cmp)** because it's faster and the community is more active.
+ [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  + The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter in Neovim and to provide some basic functionality such as highlighting based on it.

I have also installed the language servers as follows:

+ bashls
+ clangd
+ cmake
+ gopls
+ html
+ jsonls
+ lua_ls
+ rust_analyzer
+ sqlls
+ vimls

## Plugin List

### [lazy-lock.json](https://github.com/Sidney-Tan/neovim-config/blob/master/lazy-lock.json):

+ 🔒 Lockfile `lazy-lock.json` is used to keep track of installed plugins.
### ai

+ [olimorris/codecompanion.nvim](https://dotfyle.com/plugins/olimorris/codecompanion.nvim)
+ [monkoose/neocodeium](https://dotfyle.com/plugins/monkoose/neocodeium)
### code-runner

+ [michaelb/sniprun](https://dotfyle.com/plugins/michaelb/sniprun)
### colorscheme

+ [sainnhe/gruvbox-material](https://dotfyle.com/plugins/sainnhe/gruvbox-material)
### colorscheme-creation

+ [rktjmp/lush.nvim](https://dotfyle.com/plugins/rktjmp/lush.nvim)
### comment

+ [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)
### competitive-programming

+ [kawre/leetcode.nvim](https://dotfyle.com/plugins/kawre/leetcode.nvim)
### completion

+ [zbirenbaum/copilot.lua](https://dotfyle.com/plugins/zbirenbaum/copilot.lua)
+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
### cursorline

+ [RRethy/vim-illuminate](https://dotfyle.com/plugins/RRethy/vim-illuminate)
### debugging

+ [rcarriga/nvim-dap-ui](https://dotfyle.com/plugins/rcarriga/nvim-dap-ui)
+ [mfussenegger/nvim-dap](https://dotfyle.com/plugins/mfussenegger/nvim-dap)
### diagnostics

+ [folke/trouble.nvim](https://dotfyle.com/plugins/folke/trouble.nvim)
### editing-support

+ [HiPhish/rainbow-delimiters.nvim](https://dotfyle.com/plugins/HiPhish/rainbow-delimiters.nvim)
+ [windwp/nvim-autopairs](https://dotfyle.com/plugins/windwp/nvim-autopairs)
### file-explorer

+ [nvim-neo-tree/neo-tree.nvim](https://dotfyle.com/plugins/nvim-neo-tree/neo-tree.nvim)
### formatting

+ [stevearc/conform.nvim](https://dotfyle.com/plugins/stevearc/conform.nvim)
### fuzzy-finder

+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
### git

+ [sindrets/diffview.nvim](https://dotfyle.com/plugins/sindrets/diffview.nvim)
+ [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)
### icon

+ [ziontee113/icon-picker.nvim](https://dotfyle.com/plugins/ziontee113/icon-picker.nvim)
+ [nvim-tree/nvim-web-devicons](https://dotfyle.com/plugins/nvim-tree/nvim-web-devicons)
### indent

+ [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)
### keybinding

+ [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)
### lsp

+ [simrat39/symbols-outline.nvim](https://dotfyle.com/plugins/simrat39/symbols-outline.nvim)
+ [hedyhli/outline.nvim](https://dotfyle.com/plugins/hedyhli/outline.nvim)
+ [rachartier/tiny-inline-diagnostic.nvim](https://dotfyle.com/plugins/rachartier/tiny-inline-diagnostic.nvim)
+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
### lua-colorscheme

+ [ellisonleao/gruvbox.nvim](https://dotfyle.com/plugins/ellisonleao/gruvbox.nvim)
### markdown-and-latex

+ [MeanderingProgrammer/render-markdown.nvim](https://dotfyle.com/plugins/MeanderingProgrammer/render-markdown.nvim)
### marks

+ [ThePrimeagen/harpoon](https://dotfyle.com/plugins/ThePrimeagen/harpoon)
### media

+ [HakonHarnes/img-clip.nvim](https://dotfyle.com/plugins/HakonHarnes/img-clip.nvim)
+ [3rd/image.nvim](https://dotfyle.com/plugins/3rd/image.nvim)
### motion

+ [folke/flash.nvim](https://dotfyle.com/plugins/folke/flash.nvim)
### nvim-dev

+ [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
### plugin-manager

+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
### scrolling

+ [karb94/neoscroll.nvim](https://dotfyle.com/plugins/karb94/neoscroll.nvim)
### snippet

+ [dcampos/nvim-snippy](https://dotfyle.com/plugins/dcampos/nvim-snippy)
+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
### startup

+ [goolord/alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim)
### statusline

+ [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)
### syntax

+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
+ [kylechui/nvim-surround](https://dotfyle.com/plugins/kylechui/nvim-surround)
### tabline

+ [romgrk/barbar.nvim](https://dotfyle.com/plugins/romgrk/barbar.nvim)
### terminal-integration

+ [akinsho/toggleterm.nvim](https://dotfyle.com/plugins/akinsho/toggleterm.nvim)
### utility

+ [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
+ [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
+ [stevearc/dressing.nvim](https://dotfyle.com/plugins/stevearc/dressing.nvim)
+ [sitiom/nvim-numbertoggle](https://dotfyle.com/plugins/sitiom/nvim-numbertoggle)

## Plugin Configs

My [plugin configs](https://github.com/Sidney-Tan/neovim-config/tree/master/lua/plugins):

+ 📁 Configurable in multiple files.

## Other configs

[Other configs](https://github.com/Sidney-Tan/neovim-config/tree/master/lua/configs), as follows:

+ [Vim basic configs](https://github.com/Sidney-Tan/neovim-config/blob/master/lua/configs/basic.lua) 
+ [Lazy configs](https://github.com/Sidney-Tan/neovim-config/blob/master/lua/configs/lazy.lua)
+ [Keymaps in addiction to my plugin configs](https://github.com/Sidney-Tan/neovim-config/blob/master/lua/configs/keybindings.lua)
+ [Autocmds](https://github.com/Sidney-Tan/neovim-config/blob/master/lua/configs/autocmds.lua)
+ [Vimscript form configs](https://github.com/Sidney-Tan/neovim-config/blob/master/lua/configs/vim-config.lua) 

## License

This project is licensed under the MIT License. See the [LICENSE](https://github.com/Sidney-Tan/neovim-config/blob/master/LICENSE) file for details.

