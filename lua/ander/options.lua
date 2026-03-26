vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

-- Apariencia y comportamiento general
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.scrolloff = 10
opt.sidescrolloff = 8
opt.wrap = false
opt.splitbelow = true
opt.splitright = true
opt.timeoutlen = 300
opt.termguicolors = true
opt.laststatus = 3
opt.mouse = ""
opt.shortmess:append("I")
opt.exrc = true

-- Indentación
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.autoindent = true
opt.smartindent = true
opt.softtabstop = 4
opt.shiftround = true

-- Búsqueda
opt.ignorecase = true
opt.smartcase = true

-- Completado
opt.completeopt = "menu,menuone,noselect"
opt.pumheight = 10

-- Archivos y undo
opt.undofile = true
opt.updatetime = 250

-- Portapapeles
opt.clipboard:append("unnamedplus")
