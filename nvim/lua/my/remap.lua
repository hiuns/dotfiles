-- leader key
vim.g.mapleader = " "
-- project view - file tree
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
-- don't ever press Q
vim.keymap.set("n", "Q", "<nop>")
-- source - applies vim config
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so ~/github/dotfiles/nvim/init.lua")
end)
-- move highlighted texts up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- keeps cursor in place when J (moves bottom line next to current line)
vim.keymap.set("n", "J", "mzJ`z")
-- keeps cursor in the middle of screen when moving up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- keeps cursor in the middle of screen when searching words
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- when pasting over a text, keeps previously copied text in buffer
vim.keymap.set("x", "<leader>p", [["_dP]])
-- copies to system clipboard and separates it from yanked text in vim
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- delete without putting into register
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
-- start replacing the word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- make current file executable
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/my/packer.lua<CR>");
-- vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- force vim commands
vim.keymap.set("n", "<Left>", function() print("Use h") end)
vim.keymap.set("n", "<Down>", function() print("Use j") end) 
vim.keymap.set("n", "<Up>", function() print("Use k") end)
vim.keymap.set("n", "<Right>", function() print("Use l") end)
vim.keymap.set("i", "<Left>", function() print("Use h") end)
vim.keymap.set("i", "<Down>", function() print("Use j") end)
vim.keymap.set("i", "<Up>", function() print("Use k") end)
vim.keymap.set("i", "<Right>", function() print("Use l") end)
vim.keymap.set("v", "<Left>", function() print("Use h") end)
vim.keymap.set("v", "<Down>", function() print("Use j") end)
vim.keymap.set("v", "<Up>", function() print("Use k") end)
vim.keymap.set("v", "<Right>", function() print("Use l") end)

-- competitive programming
vim.keymap.set("i", "{", "{}<Left>")
vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O")
vim.keymap.set("i", "{{", "{")
vim.keymap.set("i", "{}", "{}")
-- vim.keymap.set("n", "test1", ":w <CR> :!clear ; g++ --std=c++11 -O2 -Wall %; if [ -f a.out ]; then time ./a.out; rm a.out; fi <CR>")
-- vim.keymap.set("n", "<function key>", ":vs %:r.in <CR>")
-- vim.keymap.set("n", "<function key>", ":w <bar> :!g++ --std=c++11 -O2 -Wall %:r.cc -o %:r<CR>")
-- vim.keymap.set("n", "<function key>", ":!time ./%:r < %:r.in <CR>")
-- vim.keymap.set("n", "rcp", ":r ~/[directory]/cpp_template.cc<CR>")
