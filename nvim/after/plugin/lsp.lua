-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
-- https://github.com/VonHeikemen/lsp-zero.nvim
local lsp = require('lsp-zero')
lsp.preset('recommended')

-- (Optional) Configure lua language server for neovim
-- lsp.nvim_workspace()

lsp.setup()
