vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.shiftwidth = 4
vim.opt.expandtab = false
vim.o.tabstop = 4
vim.o.smarttab = true

vim.o.colorcolumn = "91"
vim.o.textwidth = 90
vim.opt.wrap = false

vim.o.number = true
vim.o.relativenumber = true

vim.o.cursorline = true

vim.opt.scrolloff = 10

vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"
vim.opt.breakindent = true

vim.opt.undofile = true

vim.opt.mouse = {}

vim.g.termguicolors = true

require("config.keymap")
