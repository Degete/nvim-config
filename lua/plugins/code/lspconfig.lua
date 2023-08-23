-- https://github.com/neovim/nvim-lspconfig

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, { noremap = true, silent = true, desc = "Open diagnostics in a window" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true, silent = true, desc = "Go to previous" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true, silent = true, desc = "Go to next" })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { noremap = true, silent = true, desc = "Set loclist" })

-- Set icons for diagnostic errors
vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "󰌶", texthl = "DiagnosticSignHint" })

-- -- Use an on_attach function to only map the following keys
-- -- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
--   -- Enable completion triggered by <c-x><c-o>
--   vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

--   -- Mappings.
--   -- See `:help vim.lsp.*` for documentation on any of the below functions
--   local bufopts = { noremap=true, silent=true, buffer=bufnr }
--   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
--   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--   vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
--   vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
--   vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
--   vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
--   vim.keymap.set('n', '<space>wl', function()
--     print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
--   end, bufopts)
--   vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
--   vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
--   vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
--   vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--   vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
-- end

-- -- Use a loop to conveniently call 'setup' on multiple servers and
-- -- map buffer local keybindings when the language server attaches
-- local servers = {
--   'ansiblels',
--   'bashls',
--   'clangd',
--   'cssls',
--   'dockerls',
--   'html',
--   'intelephense',
--   'jsonls',
--   'pyright',
--   'rust_analyzer',
--   'sourcekit',
--   'tailwindcss',
--   'terraformls',
--   'tflint',
--   'tsserver',
--   'vuels',
-- }

-- -- Add additional capabilities supported by nvim-cmp
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- -- capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
-- -- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- -- capabilities.textDocument.completion.completionItem.preselectSupport = true
-- -- capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
-- -- capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
-- -- capabilities.textDocument.completion.completionItem.deprecatedSupport = true
-- -- capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
-- -- capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
-- -- capabilities.textDocument.completion.completionItem.resolveSupport = {
-- --   properties = {
-- --     'documentation',
-- --     'detail',
-- --     'additionalTextEdits',
-- --   },
-- -- }
-- -- Setup lspconfig.
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- local lsp_flags = {
--   -- This is the default in Nvim 0.7+
--   debounce_text_changes = 150,
-- }

-- -- Config
-- local nvim_lsp = require('lspconfig')

-- for _, lsp in ipairs(servers) do
--   nvim_lsp[lsp].setup {
--     on_attach = on_attach,
--     flags = lsp_flags,
--     capabilities = capabilities,
--   }
-- end