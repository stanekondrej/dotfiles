vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10

-- i like tabs, just not super wide
vim.opt.expandtab = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- disable line wrapping
vim.opt.wrap = false

-- search
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.signcolumn = "yes"

vim.opt.breakindent = true
vim.opt.wrap = false
vim.opt.undofile = true

vim.opt.cursorline = true

vim.opt.inccommand = "split"

-- disable mouse
vim.opt.mouse = {}

-- keymaps
vim.g.mapleader = " "

vim.g.termguicolors = true

vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- clipboard
vim.o.clipboard = "unnamedplus"

-- initialize lazy.nvim
require("config.lazy")
