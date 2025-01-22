vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'
vim.keymap.set('n', '<leader>ls', vim.cmd.Ex)

-- move highlighted texts up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- keeps cursor in place when J (moves bottom line next to current line)
vim.keymap.set('n', 'J', 'mzJ`z')

-- keeps cursor in the middle of screen when moving up and down
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<c-d>', '<c-d>zz')

-- keeps cursor in the middle of screen when searching words
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

vim.keymap.set('n', 'Q', '<nop>')

-- select all
vim.keymap.set('n', '<C-a>', 'gg<S-v>G')
-- vim.keymap.set('n', '<C-f>', '<cmd>silent !tmux neww tmux-sessionizer<CR>')

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

-- when pasting over a text, keeps previously copied text in buffer
vim.keymap.set('x', '<leader>p', [["_dP]])
-- yank to clipboard
vim.keymap.set({ 'n', 'v' }, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])
-- delete without putting into register
vim.keymap.set({ 'n', 'v' }, '<leader>d', [["_d]])
vim.keymap.set({ 'n' }, '<leader>dd', [["_dd]])
-- start replacing the word under cursor
vim.keymap.set('n', '<leader>r', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- make current file executable
vim.keymap.set('n', '<leader>x', '<cmd>!chmod +x %<CR>', { silent = true })

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.api.nvim_create_user_command('Clear', function()
  vim.api.nvim_buf_set_lines(0, 0, -1, false, {})
end, { desc = 'Clear all lines in the current buffer' })

-- force vim commands
vim.keymap.set({ 'i', 'n', 'v' }, '<Left>', function()
  print 'Use h'
end)
vim.keymap.set({ 'i', 'n', 'v' }, '<Down>', function()
  print 'Use j'
end)
vim.keymap.set({ 'i', 'n', 'v' }, '<Up>', function()
  print 'Use k'
end)
vim.keymap.set({ 'i', 'n', 'v' }, '<Right>', function()
  print 'Use l'
end)

-- competitive programming
-- vim.keymap.set('i', '{', '{}<Left>')
vim.keymap.set('i', '{<CR>', '{<CR>}<Esc>O')
vim.keymap.set('i', '(<CR>', '(<CR>)<Esc>O')
vim.keymap.set('i', '[<CR>', '[<CR>]<Esc>O')
-- vim.keymap.set('i', '{{', '{')
-- vim.keymap.set('i', '{}', '{}')
vim.keymap.set('n', '<leader>cc', ':w <bar> :!gcc %:r.c -o %:r && ./%:r<CR>')
