vim.opt.number = true
vim.opt.relativenumber = false

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = true

vim.opt.undofile = true
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/.undodir//'
-- vim.opt.backupdir = os.getenv("HOME") .. "/.vim/.backup//"
-- vim.opt.directory = os.getenv("HOME") .. "/.vim/.swp//"

vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.inccommand = 'split'

vim.opt.termguicolors = true
vim.opt.mouse = ''
vim.opt.showmode = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 50
-- vim.opt.colorcolumn = '80'
