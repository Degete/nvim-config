-- Install and load lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Install plugins
return require('lazy').setup({
  -- Notifications
  {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require("notify")
    end
  },

  -- Sessions ---------------------------------------------------------------------
  {
    'Shatur/neovim-session-manager',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    init = function()
      return require('plugins.tools.session-manager_setup')
    end,
    config = function()
      return require('plugins.tools.session-manager')
    end,
  },

  -- Code -------------------------------------------------------------------------
  -- Config
  -- {
  --   'folke/neoconf.nvim',
  --   cmd = "Neoconf",
  --   config = function()
  --     return require('plugins.code.neoconf')
  --   end,
  -- },
  -- Treesitter
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      {
        'nvim-treesitter/nvim-treesitter-context',
        config = function()
          return require('plugins.code.treesitter-context')
        end,
      },
      {
        'windwp/nvim-ts-autotag',
        config = function()
          return require('plugins.code.nvim-ts-autotag')
        end,
      },
      'hiphish/rainbow-delimiters.nvim',
    },
    build = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = function()
      return require('plugins.code.treesitter')
    end,
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      {
        'williamboman/mason-lspconfig.nvim',
        dependencies = {
          {
            'williamboman/mason.nvim',
            build = ":MasonUpdate", -- :MasonUpdate updates registry contents
            config = function()
              return require('plugins.code.mason')
            end,
          },
          'simrat39/rust-tools.nvim',
        },
        config = function()
          return require('plugins.code.mason-lspconfig')
        end,
      },
      {
        'jay-babu/mason-null-ls.nvim',
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
          'williamboman/mason.nvim',
          'jose-elias-alvarez/null-ls.nvim',
        },
        config = function()
          return require('plugins.code.mason-null-ls')
        end,
      },
      {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = {
          'williamboman/mason.nvim',
          'mfussenegger/nvim-dap',
        },
        config = function()
          return require('plugins.code.mason-nvim-dap')
        end,
      },
    },
    config = function()
      return require('plugins.code.lspconfig')
    end,
  },
  {
    'folke/neodev.nvim',
    config = function()
      require("neodev").setup({
        library = {
          plugins = {
            'nvim-dap-ui',
            'neotest',
          },
          types = true,
        },
      })
    end
  },

  -- Autocomplete
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      -- General
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      -- Snippets
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      -- Extra
      'hrsh7th/cmp-nvim-lua',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-nvim-lsp-document-symbol',
    },
    config = function()
      return require('plugins.code.cmp')
    end,
  },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {},
  },

  -- Navigation
  {
    'chaoren/vim-wordmotion'
  },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  -- Comment
  {
    'numToStr/Comment.nvim',
    config = function()
      return require('plugins.code.comment')
    end,
  },

  -- Text edition
  {
    'ur4ltz/surround.nvim',
    config = function()
      return require('plugins.code.surround')
    end,
  },

  -- Correction
  {
    'kosayoda/nvim-lightbulb',
    config = function()
      return require('plugins.code.lightbulb')
    end,
  },
  {
    'folke/trouble.nvim',
    dependencies = 'nvim-tree/nvim-web-devicons',
    init = function()
      return require('plugins.code.trouble_setup')
    end,
    config = function()
      return require('plugins.code.trouble')
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      return require('plugins.code.todo_comments')
    end,
  },

  -- Debug
  {
    -- https://github.com/mfussenegger/nvim-dap
    'mfussenegger/nvim-dap',
    dependencies = {
      'jbyuki/one-small-step-for-vimkind',
      'one-small-step-for-vimkind',
      {
        'theHamsta/nvim-dap-virtual-text',
        config = function()
          return require('plugins.code.dap-virtual-text')
        end,
      },
    },
    init = function()
      return require('plugins.code.dap_setup')
    end,
    config = function()
      return require('plugins.code.dap')
    end,
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap',
    },
    init = function()
      return require('plugins.code.dapui_setup')
    end,
    config = function()
      return require('plugins.code.dapui')
    end,
  },

  -- Testing
  {
    'vim-test/vim-test',
    init = function()
      return require('plugins.code.vim-test_setup')
    end,
  },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'nvim-neotest/neotest-vim-test',
      'nvim-neotest/neotest-plenary',
      'nvim-neotest/neotest-python',
      'nvim-neotest/neotest-go',
      'rouge8/neotest-rust',
      'marilari88/neotest-vitest',
      'stevanmilic/neotest-scala',
    },
    init = function()
      return require('plugins.code.neotest_setup')
    end,
    config = function()
      return require('plugins.code.neotest')
    end,
  },

  -- Language tools
  -- Rust
  {
    'saecki/crates.nvim',
    -- version = 'v0.3.0',
    -- event = { "BufRead Cargo.toml" },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    init = function()
      return require('plugins.languages.rust.crates_setup')
    end,
    config = function()
      return require('plugins.languages.rust.crates')
    end,
  },

  -- UI ---------------------------------------------------------------------------
  -- Dev icons
  {
    'nvim-tree/nvim-web-devicons',
  },

  -- Statusline
  {
    'hoob3rt/lualine.nvim',
    dependencies = {
      {
        'nvim-tree/nvim-web-devicons',
        lazy = true
      },
    },
    config = function()
      return require('plugins.ui.lualine')
    end,
  },
  {
    'folke/zen-mode.nvim',
    dependencies = {
      {
        'folke/twilight.nvim',
        config = function()
          return require('plugins.ui.twilight')
        end
      },
    },
    config = function()
      return require('plugins.ui.zen-mode')
    end
  },

  -- Registers
  {
    'tversteeg/registers.nvim',
    config = function()
      return require('plugins.tools.registers')
    end,
  },

  -- Indentation
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      return require('plugins.ui.indent-blankline')
    end,
  },

  -- Colorizer
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      return require('plugins.ui.colorizer')
    end,
  },

  -- Git
  {
    'tpope/vim-fugitive',
    cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' },
  },
  {
    'tpope/vim-rhubarb',
  },
  {
    'lewis6991/gitsigns.nvim',
    -- version = 'release', -- To the latest release
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = function()
      return require('plugins.ui.gitsigns')
    end,
  },
  {
    'sindrets/diffview.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      return require('plugins.tools.diffview')
    end,
  },

  -- Tools ------------------------------------------------------------------------
  -- Search
  {
    -- https://github.com/nvim-telescope/telescope.nvim
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
      },
      {
        'nvim-telescope/telescope-frecency.nvim',
        dependencies = {
          'kkharji/sqlite.lua',
        }
      },
      'nvim-telescope/telescope-ui-select.nvim',
      'nvim-telescope/telescope-dap.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      'nvim-telescope/telescope-project.nvim',
      'nvim-telescope/telescope-media-files.nvim',
      'nvim-telescope/telescope-symbols.nvim',
      'nvim-telescope/telescope-github.nvim',
    },
    init = function()
      return require('plugins.tools.telescope_setup')
    end,
    config = function()
      return require('plugins.tools.telescope')
    end,
    cmd = 'Telescope',
  },
  -- {
  --   -- https://github.com/ibhagwan/fzf-lua
  --   'ibhagwan/fzf-lua',
  --   dependencies = {
  --     'nvim-tree/nvim-web-devicons',
  --   },
  --   init = function()
  --     return require('plugins.tools.fzf-lua_setup')
  --   end,
  --   config = function()
  --     return require('plugins.tools.fzf-lua')
  --   end,
  -- },

  -- Explorer
  -- {
  --   -- https://github.com/kyazdani42/nvim-tree.lua
  --   "nvim-tree/nvim-tree.lua",
  --   version = "*",
  --   lazy = false,
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --     {
  --       'antosha417/nvim-lsp-file-operations',
  --       requires = {
  --         "nvim-lua/plenary.nvim",
  --         "nvim-tree/nvim-tree.lua",
  --       },
  --       config = function()
  --         require("lsp-file-operations").setup()
  --       end,
  --     },
  --     -- {
  --     --   'echasnovski/mini.base16',
  --     --   version = false,
  --     --   config = function()
  --     --     require('mini.base16').setup()
  --     --   end,
  --     -- },
  --   },
  --   config = function()
  --     return require('plugins.tools.nvim-tree')
  --   end,
  -- },
  -- {
  --   'echasnovski/mini.nvim',
  --   version = false,
  -- },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v3.x",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      {
        -- only needed if you want to use the commands with "_with_window_picker" suffix
        's1n7ax/nvim-window-picker',
        event = 'VeryLazy',
        version = '2.*',
        config = function()
          require('window-picker').setup({
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { 'neo-tree', "neo-tree-popup", "notify" },

                -- if the buffer type is one of following, the window will be ignored
                buftype = { 'terminal', "quickfix" },
              },
            },
            other_win_hl_color = '#e35e4f',
          })
        end,
      },
    },
    init = function()
      return require('plugins.tools.neo-tree_setup')
    end,
    config = function()
      return require('plugins.tools.neo-tree')
    end,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      return require('plugins.tools.project-nvim')
    end
  },

  -- Terminal
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {},
    -- config = true,
    config = function()
      return require('plugins.tools.toggleterm')
    end,
  },

  -- Window management
  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
      return require('plugins.tools.which-key')
    end,
  },

  -- Themes -----------------------------------------------------------------------
  {
    'nyngwang/nvimgelion',
    -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins
    config = function ()
      -- do whatever you want for further customization~
      -- vim.cmd[[colors nvimgelion]]
    end
  },
  {
    -- https://github.com/projekt0n/github-nvim-theme
    'projekt0n/github-nvim-theme',
    -- lazy = false, -- make sure we load this during startup if it is your main colorscheme
    -- priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      return require('plugins.themes.github')
    end,
  },
  {
    -- https://github.com/arcticicestudio/nord-vim
    'arcticicestudio/nord-vim',
    config = function()
      return require('plugins.themes.nord')
    end,
  },
  {
    -- https://github.com/morhetz/gruvbox
    'morhetz/gruvbox',
    config = function()
      return require('plugins.themes.gruvbox')
    end,
  },
  {
    -- https://github.com/folke/tokyonight.nvim
    'folke/tokyonight.nvim',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      return require('plugins.themes.tokyonight')
    end,
  },
  {
    -- https://github.com/loctvl842/monokai-pro.nvim
    'loctvl842/monokai-pro.nvim',
    config = function()
      return require('plugins.themes.monokai')
    end,
  },
}, {
  root = vim.fn.stdpath("data") .. "/lazy", -- directory where plugins will be installed
  defaults = {
    lazy = false, -- should plugins be lazy-loaded?
    version = nil,
    -- default `cond` you can use to globally disable a lot of plugins
    -- when running inside vscode for example
    cond = nil, ---@type boolean|fun(self:LazyPlugin):boolean|nil
    -- version = "*", -- enable this to try installing the latest stable versions of plugins
  },
  -- leave nil when passing the spec as the first argument to setup()
  spec = nil, ---@type LazySpec
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
  concurrency = jit.os:find("Windows") and (vim.loop.available_parallelism() * 2) or nil, ---@type number limit the maximum amount of concurrent tasks
  git = {
    -- defaults for the `Lazy log` command
    -- log = { "-10" }, -- show the last 10 commits
    log = { "-8" }, -- show commits from the last 3 days
    timeout = 120, -- kill processes that take more than 2 minutes
    url_format = "https://github.com/%s.git",
    -- lazy.nvim requires git >=2.19.0. If you really want to use lazy with an older version,
    -- then set the below to false. This should work, but is NOT supported and will
    -- increase downloads a lot.
    filter = true,
  },
  dev = {
    -- directory where you store your local plugin projects
    path = "~/projects",
    ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
    patterns = {}, -- For example {"folke"}
    fallback = false, -- Fallback to git when local plugin doesn't exist
  },
  install = {
    -- install missing plugins on startup. This doesn't increase startup time.
    missing = true,
    -- try to load one of these colorschemes when starting an installation during startup
    colorscheme = { "habamax" },
  },
  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 0.9, height = 0.9 },
    wrap = true, -- wrap the lines in the ui
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "rounded",
    title = nil, ---@type string only works when border is not "none"
    title_pos = "center", ---@type "center" | "left" | "right"
    -- Show pills on top of the Lazy window
    pills = true, ---@type boolean
    icons = {
      cmd = " ",
      config = "",
      event = "",
      ft = " ",
      init = " ",
      import = " ",
      keys = " ",
      lazy = "󰒲 ",
      loaded = "●",
      not_loaded = "○",
      plugin = " ",
      runtime = " ",
      source = " ",
      start = "",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
    -- leave nil, to automatically select a browser depending on your OS.
    -- If you want to use a specific browser, you can define it here
    browser = nil, ---@type string?
    throttle = 20, -- how frequently should the ui process render events
    custom_keys = {
      -- you can define custom key maps here.
      -- To disable one of the defaults, set it to false

      -- open lazygit log
      ["<localleader>l"] = function(plugin)
        require("lazy.util").float_term({ "lazygit", "log" }, {
          cwd = plugin.dir,
        })
      end,

      -- open a terminal for the plugin dir
      ["<localleader>t"] = function(plugin)
        require("lazy.util").float_term(nil, {
          cwd = plugin.dir,
        })
      end,
    },
  },
  diff = {
    -- diff command <d> can be one of:
    -- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
    --   so you can have a different command for diff <d>
    -- * git: will run git diff and open a buffer with filetype git
    -- * terminal_git: will open a pseudo terminal with git diff
    -- * diffview.nvim: will open Diffview to show the diff
    cmd = "git",
  },
  checker = {
    -- automatically check for plugin updates
    enabled = true,
    concurrency = nil, ---@type number? set to 1 to check for updates very slowly
    notify = true, -- get a notification when new updates are found
    frequency = 3600, -- check for updates every hour
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = true, -- get a notification when changes are found
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true, -- reset the package path to improve startup time
    rtp = {
      reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
      ---@type string[]
      paths = {}, -- add any custom paths here that you want to includes in the rtp
      ---@type string[] list any plugins you want to disable here
      disabled_plugins = {
        -- "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        -- "tarPlugin",
        -- "tohtml",
        -- "tutor",
        -- "zipPlugin",
      },
    },
  },
  -- lazy can generate helptags from the headings in markdown readme files,
  -- so :help works even for plugins that don't have vim docs.
  -- when the readme opens with :help it will be correctly displayed as markdown
  readme = {
    enabled = true,
    root = vim.fn.stdpath("state") .. "/lazy/readme",
    files = { "README.md", "lua/**/README.md" },
    -- only generate markdown helptags for plugins that dont have docs
    skip_if_doc_exists = true,
  },
  state = vim.fn.stdpath("state") .. "/lazy/state.json", -- state info for checker and other things
  build = {
    -- Plugins can provide a `build.lua` file that will be executed when the plugin is installed
    -- or updated. When the plugin spec also has a `build` command, the plugin's `build.lua` not be
    -- executed. In this case, a warning message will be shown.
    warn_on_override = true,
  },
})
