return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', config = true }, -- Must be loaded before its dependents
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      { 'folke/neodev.nvim', opts = {} },
    },
    config = function()
      -- Autocommand that runs whenever an LSP attaches to a buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc)
            vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Basic keymaps for LSP
          map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
          map('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- If the server can do documentHighlight, set up highlight on CursorHold
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client.server_capabilities.documentHighlightProvider then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })

            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds {
                  group = 'kickstart-lsp-highlight',
                  buffer = event2.buf,
                }
              end,
            })
          end

          -- If inlay hints are supported, map a toggle
          if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
            map('<leader>th', function()
              -- For Neovim 0.10+ inlay_hints are toggled differently.
              -- If you use an older version, you may need: vim.lsp.inlay_hint(0, nil)
              local buffers = { event.buf }
              local hints_enabled = vim.lsp.inlay_hint.get(bufnr) -- or (some custom check)
              if hints_enabled then
                vim.lsp.inlay_hint(bufnr, false)
              else
                vim.lsp.inlay_hint(bufnr, true)
              end
            end, '[T]oggle Inlay [H]ints')
          end
        end,
      })

      -- Merge base LSP capabilities with cmp-nvim-lsp
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

      -- Define which servers you want
      local servers = {
        pyright = {
          settings = {
            python = {
              analysis = {
                typeCheckingMode = 'basic', -- Options: off | basic | strict
              },
            },
          },
        },
        ts_ls = { filetypes = { 'javascript', 'typescript', 'typescriptreact' } },
        lua_ls = {
          settings = {
            Lua = {
              completion = { callSnippet = 'Replace' },
            },
          },
        },
      }

      require('mason').setup()

      -- Tools to ensure are installed by Mason
      local ensure_installed = vim.tbl_keys(servers)
      vim.list_extend(ensure_installed, {
        'stylua', -- Lua formatter
        'black', -- Python formatter
        'isort', -- Python import sorter
        'prettierd', -- JS/TS/CSS/HTML formatter
        'rustywind', -- Tailwind CSS class sorter
      })
      require('mason-tool-installer').setup {
        ensure_installed = ensure_installed,
      }

      -- Setup LSP servers via mason-lspconfig
      require('mason-lspconfig').setup {
        ensure_installed = { 'pyright', 'ts_ls', 'jsonls', 'lua_ls' },
        automatic_installation = true,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
