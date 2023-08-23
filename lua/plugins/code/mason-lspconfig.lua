-- https://github.com/williamboman/mason-lspconfig.nvim

local lsp_servers = {
  'ansiblels',
  'bashls',
  'clangd',
  'cssls',
  'dockerls',
  'gopls',
  'graphql',
  'html',
  'intelephense',
  'jsonls',
  'marksman',
  'pyright',
  'rust_analyzer',
  'tailwindcss',
  'taplo',
  'terraformls',
  'tflint',
  'tsserver',
  'volar',
  'yamlls',
}

require("mason-lspconfig").setup({
  -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "sumneko_lua" }
  -- This setting has no relation with the `automatic_installation` setting.
  ensure_installed = lsp_servers,

  -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
  -- This setting has no relation with the `ensure_installed` setting.
  -- Can either be:
  --   - false: Servers are not automatically installed.
  --   - true: All servers set up via lspconfig are automatically installed.
  --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
  --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
  automatic_installation = true,
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  local spread = table.unpack
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { spread(bufopts), desc = "Go to declaration"})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { spread(bufopts), desc = "Go to definition"})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { spread(bufopts), desc = "Show implementation"})
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, { spread(bufopts), desc = "Show references"})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, { spread(bufopts), desc = "Buffer hover"})
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { spread(bufopts), desc = "Show signature"})
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, { spread(bufopts), desc = "Add workspace folder"})
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, { spread(bufopts), desc = "Remove workspace folder"})
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, { spread(bufopts), desc = "List workspace folders"})
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, { spread(bufopts), desc = "Show type definition"})
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { spread(bufopts), desc = "Rename"})
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, { spread(bufopts), desc = "Code action"})
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, { spread(bufopts), desc = "Format"})

  -- Rust
  -- Hover actions
  vim.keymap.set("n", "<C-space>", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr, desc = "Hover actions" })
  -- Code action groups
  vim.keymap.set("n", "<Leader>a", require("rust-tools").code_action_group.code_action_group, { buffer = bufn, desc = "Code actions"})
  vim.keymap.set("n", "<Leader>rr", "<cmd>:RustRunnables<cr>", { buffer = bufn, desc = "Rust runnables" })
  vim.keymap.set("n", "<Leader>rd", "<cmd>:RustDebuggables<cr>", { buffer = bufn, desc = "Rust debuggables" })
end

-- Add additional capabilities supported by nvim-cmp
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.textDocument.completion.completionItem.documentationFormat = { 'markdown', 'plaintext' }
-- capabilities.textDocument.completion.completionItem.snippetSupport = true
-- capabilities.textDocument.completion.completionItem.preselectSupport = true
-- capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
-- capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
-- capabilities.textDocument.completion.completionItem.deprecatedSupport = true
-- capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
-- capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
-- capabilities.textDocument.completion.completionItem.resolveSupport = {
--   properties = {
--     'documentation',
--     'detail',
--     'additionalTextEdits',
--   },
-- }
-- Setup lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- LSP settings (for overriding per client)
local border = "rounded"
local handlers =  {
  ["textDocument/hover"] =  vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
  ["textDocument/signatureHelp"] =  vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

require("mason-lspconfig").setup_handlers({
  -- The first entry (without a key) will be the default handler
  -- and will be called for each installed server that doesn't have
  -- a dedicated handler.
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup({
      on_attach = on_attach,
      flags = lsp_flags,
      capabilities = capabilities,
      handlers = handlers,
    })
  end,
  -- Next, you can provide a dedicated handler for specific servers.
  -- For example, a handler override for the `rust_analyzer`:
  ["rust_analyzer"] = function ()
    require("rust-tools").setup({
      tools = { -- rust-tools options
        -- how to execute terminal commands
        -- options right now: termopen / quickfix
        executor = require("rust-tools.executors").termopen,

        -- callback to execute once rust-analyzer is done initializing the workspace
        -- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
        on_initialized = nil,

        -- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
        reload_workspace_from_cargo_toml = true,

        -- These apply to the default RustSetInlayHints command
        inlay_hints = {
          -- automatically set inlay hints (type hints)
          -- default: true
          auto = true,

          -- Only show inlay hints for the current line
          only_current_line = false,

          -- whether to show parameter hints with the inlay hints or not
          -- default: true
          show_parameter_hints = true,

          -- prefix for parameter hints
          -- default: "<-"
          parameter_hints_prefix = "<- ",

          -- prefix for all the other hints (type, chaining)
          -- default: "=>"
          other_hints_prefix = "=> ",

          -- whether to align to the length of the longest line in the file
          max_len_align = false,

          -- padding from the left if max_len_align is true
          max_len_align_padding = 1,

          -- whether to align to the extreme right or not
          right_align = false,

          -- padding from the right if right_align is true
          right_align_padding = 7,

          -- The color of the hints
          highlight = "Comment",
        },

        -- options same as lsp hover / vim.lsp.util.open_floating_preview()
        hover_actions = {
          -- whether the hover action window gets automatically focused
          -- default: false
          auto_focus = true,
        },
      },
      dap = {
        adapter = {
          type = "executable",
          command = '/opt/homebrew/opt/llvm/bin/lldb-vscode',
          name = "rt_lldb"
        }
      },
      server = {
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
        handlers = handlers,
      },
    })
  end
})

-- Extra servers (not available in mason)

-- SourceKit
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#sourcekit
-- https://github.com/apple/sourcekit-lsp
require('lspconfig').sourcekit.setup({
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities,
  cmd = { "sourcekit-lsp" },
  filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp" },
  root_dir = require('lspconfig').util.root_pattern("Package.swift", ".git"),
})