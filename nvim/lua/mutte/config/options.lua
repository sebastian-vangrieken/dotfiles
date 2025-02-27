vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

opt.wrap = true

opt.ignorecase = true

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"

opt.clipboard:append("unnamedplus")

opt.swapfile = false
