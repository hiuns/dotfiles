-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Undercurl
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- copied from my backup
vim.opt.mouse = ""
vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.undofile = true
vim.opt.backup = false
vim.opt.swapfile = false

vim.opt.undodir = os.getenv("HOME") .. "/.vim/.undodir//"
vim.opt.backupdir = os.getenv("HOME") .. "/.vim/.backup//"
vim.opt.directory = os.getenv("HOME") .. "/.vim/.swp//"

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

--vim.opt.colorcolumn = "80"
