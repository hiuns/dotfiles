local builtin = require('telescope.builtin')

-- Lists files in your current working directory, respects .gitignore
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- Fuzzy search through the output of git ls-files command, respects .gitignore
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- Searches for the string under your cursor or selection in your current working directory
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
-- Search for a string in your current working directory and get results live as you type, respects .gitignore. (Requires ripgrep: https://github.com/BurntSushi/ripgrep)
vim.keymap.set('n', '<leader>fg', function()
	builtin.live_grep({grep_open_files=true})
end)
-- Lists open buffers in current neovim instance
vim.keymap.set('n', '<leader>fb',
    function() builtin.buffers({
        sort_mru=true,
        ignore_current_buffer=true
    })
end)
-- Lists available help tags and opens a new window with the relevant help info on <cr>
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

