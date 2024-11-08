# Neovim Config
My latest neovim configuration.

# Plugin Manager

I have switched the plugin manager from **[packer.nvim](https://github.com/wbthomason/packer.nvim)** to **[lazy.nvim](https://github.com/folke/lazy.nvim)**.

**Lazy.nvim** is a modern plugin manager for Neovim.

One of the features that has made the most impact on me:

+ 🔌 Automatic lazy-loading of Lua modules and **lazy-loading** on events, commands, filetypes, and key mappings.

# Plugin List

My [lazy-lock.json](https://github.com/Sidney-Tan/neovim-config/blob/master/lazy-lock.json):

+ 🔒 Lockfile `lazy-lock.json` to keep track of installed plugins.

# Plugin Configs

My [plugin configs](https://github.com/Sidney-Tan/neovim-config/tree/master/lua/plugins):

+ 📁 Configurable in multiple files.

# Colorscheme

My favorite colorscheme is **[gruvbox](https://github.com/ellisonleao/gruvbox.nvim)**:

![](https://camo.githubusercontent.com/668e11d96516adbe306407d3b58a0fb22aaffbf98bc1d7edfa086ad17cd2feef/68747470733a2f2f692e706f7374696d672e63632f667933746e4746742f67727576626f782d7468656d65732e706e67)

# Lsp Related

I have switched the lsp support from **[coc](https://github.com/neoclide/coc.nvim)** to **[neovim built-in lsp](https://neovim.io/doc/user/lsp.html)**, with the plugins like as follows: 

+ [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
  + It provides basic, default Nvim LSP client configurations for various LSP servers.
+ [mason](https://github.com/williamboman/mason.nvim)
  + Portable package manager for Neovim that runs everywhere Neovim runs.
  + Easily install and manage LSP servers, DAP servers, linters, and formatters.
+ [mason-lspconfig](https://github.com/williamboman/mason-lspconfig.nvim)
  + it bridges mason with the nvim-lspconfig plugin - making it easier to use both plugins together.
+ [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
  + A completion engine plugin for neovim written in Lua. 
+ [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
  + The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter in Neovim and to provide some basic functionality such as highlighting based on it.

# Other configs

[Other configs](https://github.com/Sidney-Tan/neovim-config/tree/master/lua/configs), as follows:

+ [Vim basic configs](https://github.com/Sidney-Tan/neovim-config/blob/master/lua/configs/basic.lua) 
+ [Lazy configs](https://github.com/Sidney-Tan/neovim-config/blob/master/lua/configs/lazy.lua)
+ [Keymaps in addiction to my plugin configs](https://github.com/Sidney-Tan/neovim-config/blob/master/lua/configs/keybindings.lua)
+ [Vimscript form configs](https://github.com/Sidney-Tan/neovim-config/blob/master/lua/configs/vim-config.lua) 

