-- leader keys must be set before lazy.nvim loads
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- disable built-in netrw so nvim-tree handles directory buffers cleanly
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- line numbers for quick vertical jumps
vim.opt.number = true
vim.opt.relativenumber = true

-- 2-space indentation (standard for Dart, TypeScript, and Lua)
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

-- UI & layout
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes" -- keep signcolumn open to prevent text shifting on diagnostics
vim.opt.scrolloff = 8 -- keep context lines visible above/below cursor
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.winborder = "rounded"

-- case-insensitive search unless capital letters are used
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- sync with system clipboard & persist undo history across sessions
vim.opt.clipboard = "unnamedplus"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false

-- faster key sequence & CursorHold trigger for LSP highlights
vim.opt.timeoutlen = 300
vim.opt.updatetime = 200

-- intuitive split directions
vim.opt.mouse = "a"
vim.opt.splitbelow = true
vim.opt.splitright = true

-- LF line endings
vim.opt.fileformat = "unix"
vim.opt.fileformats = { "unix" }

-- register local Flutter & Android SDK in ~/development for LSP and emulator runners
local home = vim.fn.expand("~")
local android_home = home .. "/development/android-sdk"
vim.env.ANDROID_HOME = android_home
vim.env.ANDROID_SDK_ROOT = android_home
vim.env.PATH = table.concat({
  home .. "/development/flutter/bin",
  android_home .. "/cmdline-tools/latest/bin",
  android_home .. "/platform-tools",
  android_home .. "/emulator",
  vim.env.PATH,
}, ":")
