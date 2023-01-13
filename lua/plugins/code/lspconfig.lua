-- https://github.com/neovim/nvim-lspconfig
-- use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
-- use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
-- use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
-- use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
-- use 'L3MON4D3/LuaSnip' -- Snippets plugin

-- Config
local nvim_lsp = require('lspconfig')
local util = nvim_lsp.util

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
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
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  'ansiblels',
  'bashls',
  'clangd',
  'cssls',
  'dockerls',
  'html',
  'intelephense',
  'jsonls',
  'pyright',
  'rust_analyzer',
  'sourcekit',
  'tailwindcss',
  'terraformls',
  'tflint',
  'tsserver',
  'vuels',
}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = capabilities,
  }
end

-- Language servers
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md

-- Ansible
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#ansiblels
-- https://github.com/ansible/ansible-language-server
require'lspconfig'.ansiblels.setup{
  cmd = { "ansible-language-server", "--stdio" },
  filetypes = { "yaml" },
  root_dir = function(fname)
        return util.root_pattern { '*.yml', '*.yaml' }(fname)
      end,
  settings = {
    ansible = {
      ansible = {
        path = "ansible",
      },
      ansibleLint = {
        enabled = true,
        path = "ansible-lint",
      },
      python = {
        interpreterPath = "python",
      },
    },
  },
}

-- Bash
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#bashls
-- https://github.com/bash-lsp/bash-language-server
require'lspconfig'.bashls.setup{
  cmd = { "beancount-langserver" },
  filetypes = { "beancount" },
  init_options = {
    journalFile = "",
    pythonPath = "python3",
  },
  root_dir = nvim_lsp.util.root_pattern("elm.json"),
}

-- C/C++
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#clangd
-- https://clangd.llvm.org/installation.html
require'lspconfig'.clangd.setup{
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = nvim_lsp.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git") or dirname,
}
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#cmake
-- https://github.com/regen100/cmake-language-server
require'lspconfig'.cmake.setup{
  cmd = { "cmake-language-server" },
  filetypes = { "cmake" },
  init_options = {
    buildDirectory = "build",
  },
  root_dir = nvim_lsp.util.root_pattern(".git", "compile_commands.json", "build") or dirname,
}

-- CSS
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#cssls
-- https://github.com/hrsh7th/vscode-langservers-extracted
require'lspconfig'.cssls.setup{
  cmd = { "vscode-css-language-server", "--stdio" },
  filetypes = { "css", "scss", "less" },
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  settings = {
    css = {
      validate = true,
    },
    less = {
      validate = true,
    },
    scss = {
      validate = true,
    },
  }
}

-- Docker
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#dockerls
-- https://github.com/rcjsuen/dockerfile-language-server-nodejs
require'lspconfig'.dockerls.setup{
  cmd = { "docker-langserver", "--stdio" },
  filetypes = { "Dockerfile", "dockerfile" },
  root_dir = nvim_lsp.util.root_pattern("Dockerfile"),
}

-- Golang
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#gopls
-- https://github.com/golangci/golangci-lint
-- https://github.com/golang/tools/tree/master/gopls
require'lspconfig'.golangci_lint_ls.setup{
  cmd = { "golangci-lint-langserver" },
  filetypes = { "go", "gomod" },
  init_options = {
    command = { "golangci-lint", "run", "--out-format", "json" }
  },
  root_dir = nvim_lsp.util.root_pattern('go.work') or nvim_lsp.util.root_pattern('go.mod', '.golangci.yaml', '.git'),
}
require'lspconfig'.gopls.setup{
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gotmpl" },
  root_dir = nvim_lsp.util.root_pattern("go.mod", ".git"),
  single_file_support = true,
}

-- HTML
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#html
-- https://github.com/hrsh7th/vscode-langservers-extracted
require'lspconfig'.html.setup{
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "html" },
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
  },
  root_dir = function(fname)
    return util.root_pattern('package.json', '.git')(fname) or util.path.dirname(fname)
  end,
  settings = {}
}

-- PHP
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#intelephense
-- https://intelephense.com/
require'lspconfig'.intelephense.setup{
  cmd = { "intelephense", "--stdio" },
  filetypes = { "php" },
  root_dir = nvim_lsp.util.root_pattern("composer.json", ".git"),
}

-- JSON
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#jsonls
-- https://github.com/hrsh7th/vscode-langservers-extracted
require'lspconfig'.jsonls.setup {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json" },
  init_options = {
    provideFormatter = true,
  },
  root_dir = nvim_lsp.util.root_pattern(".git") or dirname,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
    },
  },
}

-- Python
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#pyright
-- https://github.com/microsoft/pyright
require'lspconfig'.pyright.setup{
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_dir = function(fname)
        local root_files = {
          'pyproject.toml',
          'setup.py',
          'setup.cfg',
          'requirements.txt',
          'Pipfile',
          'pyrightconfig.json',
        }
        return nvim_lsp.util.root_pattern(unpack(root_files))(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
      end,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  },
}

-- Rust
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
-- https://github.com/rust-analyzer/rust-analyzer
require'lspconfig'.rust_analyzer.setup{
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_dir = nvim_lsp.util.root_pattern("Cargo.toml", "rust-project.json"),
  settings = {
    ["rust-analyzer"] = {},
  }
}

-- SourceKit
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#sourcekit
-- https://github.com/apple/sourcekit-lsp
require'lspconfig'.sourcekit.setup{
  cmd = { "sourcekit-lsp" },
  filetypes = { "swift", "c", "cpp", "objective-c", "objective-cpp" },
  root_dir = nvim_lsp.util.root_pattern("Package.swift", ".git"),
}

-- TailwindCSS
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#tailwindcss
-- https://github.com/tailwindlabs/tailwindcss-intellisense
require'lspconfig'.tailwindcss.setup{
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "django-html", "edge", "eelixir", "ejs", "erb", "eruby", "gohtml", "haml", "handlebars", "hbs", "html", "html-eex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte" },
  init_options = {
    userLanguages = {
      eelixir = "html-eex",
      eruby = "erb",
    },
  },
  on_new_config = function(new_config)
        if not new_config.settings then
          new_config.settings = {}
        end
        if not new_config.settings.editor then
          new_config.settings.editor = {}
        end
        if not new_config.settings.editor.tabSize then
          -- set tab size for hover
          new_config.settings.editor.tabSize = vim.lsp.util.get_effective_tabstop()
        end
      end,
  root_dir = nvim_lsp.util.root_pattern('tailwind.config.js', 'tailwind.config.ts', 'postcss.config.js', 'postcss.config.ts', 'package.json', 'node_modules', '.git'),
  settings = {
    tailwindCSS = {
      lint = {
        cssConflict = "warning",
        invalidApply = "error",
        invalidConfigPath = "error",
        invalidScreen = "error",
        invalidTailwindDirective = "error",
        invalidVariant = "error",
        recommendedVariantOrder = "warning"
      },
      validate = true,
    },
  },
}

-- Terraform
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#terraformls
-- https://github.com/hashicorp/terraform-ls
require'lspconfig'.terraformls.setup{
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform" },
  root_dir = nvim_lsp.util.root_pattern(".terraform", ".git"),
}
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#tflint
-- https://github.com/terraform-linters/tflint
require'lspconfig'.tflint.setup{
  cmd = { "tflint", "--langserver" },
  filetypes = { "terraform" },
  root_dir = nvim_lsp.util.root_pattern(".terraform", ".git", ".tflint.hcl"),
}

-- Typescript
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#tsserver
-- https://github.com/typescript-language-server/typescript-language-server
require'lspconfig'.tsserver.setup{
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
  init_options = {
    hostInfo = "neovim",
  },
  root_dir = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git"),
}

-- Vue
-- https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#vuels
-- https://github.com/vuejs/vetur/tree/master/server
require'lspconfig'.vuels.setup{
  cmd = { "vls" },
  filetypes = { "vue" },
  init_options = {
    config = {
      css = {},
      emmet = {},
      html = {
        suggest = {},
      },
      javascript = {
        format = {}
      },
      stylusSupremacy = {},
      typescript = {
        format = {},
      },
      vetur = {
        completion = {
          autoImport = false,
          tagCasing = "kebab",
          useScaffoldSnippets = false,
        },
        format = {
          defaultFormatter = {
            js = "none",
            ts = "none",
          },
          defaultFormatterOptions = {},
          scriptInitialIndent = false,
          styleInitialIndent = false,
        },
        useWorkspaceDependencies = false,
        validation = {
          script = true,
          style = true,
          template = true,
        },
      },
    },
  },
  root_dir = nvim_lsp.util.root_pattern("package.json", "vue.config.js"),
}