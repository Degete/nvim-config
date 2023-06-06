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
  -- Dashboard
  -- {
  --   'glepnir/dashboard-nvim',
  --   event = 'VimEnter',
  --   opts = {
  --     -- config
  --   },
  -- },

  -- Async building & commands
  {
    'tpope/vim-dispatch',
    lazy = true,
    cmd = { 'Dispatch', 'Make', 'Focus', 'Start' }
  },

  -- Sessions ---------------------------------------------------------------------
  -- {
  --   'dhruvasagar/vim-prosession',
  --   after = 'vim-obsession',
  --   dependencies = {{ 'tpope/vim-obsession', cmd = 'Prosession' }},
  --   config = [[lua require('plugins.tools.prosession')]],
  -- },
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
  -- Treesitter
  {
    -- https://github.com/nvim-treesitter/nvim-treesitter
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      -- https://github.com/nvim-treesitter/nvim-treesitter-refactor
      'nvim-treesitter/nvim-treesitter-refactor',
      -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      'nvim-treesitter/nvim-treesitter-textobjects',
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
    -- https://github.com/neovim/nvim-lspconfig
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
      }
    },
    config = function()
      return require('plugins.code.lspconfig')
    end,
  },

  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",
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

  -- Navigation
  { 'chaoren/vim-wordmotion' },
  {
    'justinmk/vim-sneak',
    config = function()
      return require('plugins.code.sneak')
    end,
  },

  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
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
    dependencies = { 'antoinemadec/FixCursorHold.nvim' },
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
      {
        'folke/neodev.nvim',
        config = function()
          require("neodev").setup({
            library = { plugins = { "nvim-dap-ui" }, types = true },
          })
        end
      }
    },
    init = function()
      return require('plugins.code.dapui_setup')
    end,
    config = function()
      return require('plugins.code.dapui')
    end,
  },

  -- -- Quickfix
  -- -- {
  -- --   -- https://github.com/kevinhwang91/nvim-bqf
  -- --   'kevinhwang91/nvim-bqf',
  -- --   ft = 'qf',
  -- -- },

  -- Language tools
  -- Rust
  -- {
  --   -- https://github.com/simrat39/rust-tools.nvim
  --   'simrat39/rust-tools.nvim',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'mfussenegger/nvim-dap',
  --   },
  --   config = function()
  --     return require('plugins.languages.rust.rust-tools')
  --   end,
  -- },
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
    -- https://github.com/nvim-tree/nvim-web-devicons
    'nvim-tree/nvim-web-devicons',
  },

  -- -- Buffers
  -- {
  --   'akinsho/bufferline.nvim',
  --   version = "*",
  --   dependencies = 'nvim-tree/nvim-web-devicons',
  --   config = function()
  --     return require('plugins.ui.bufferline')
  --   end,
  -- },
  -- -- {
  -- --   'noib3/nvim-cokeline',
  -- --   dependencies = 'nvim-tree/nvim-web-devicons', -- If you want devicons
  -- --   config = [[lua require('plugins.ui.cokeline')]],
  -- -- },

  -- Statusline
  {
    'hoob3rt/lualine.nvim',
    dependencies = {
      { 'nvim-tree/nvim-web-devicons', lazy = true },
    },
    config = function()
      return require('plugins.ui.lualine')
    end,
  },
  {
    'kdheepak/tabline.nvim',
    dependencies = {
      { 'hoob3rt/lualine.nvim', lazy = true },
      { 'nvim-tree/nvim-web-devicons', lazy = true },
    },
    config = function()
      return require('plugins.ui.tabline')
    end,
  },
  {
    'folke/zen-mode.nvim',
    dependencies = {
      {
        "folke/twilight.nvim",
        config = function()
          return require("plugins.ui.twilight")
        end
      },
    },
    config = function()
      return require("plugins.ui.zen-mode")
    end
  },

  -- Registers
  -- {
  --   'junegunn/vim-peekaboo',
  -- },
  {
    -- https://github.com/tversteeg/registers.nvim
    'tversteeg/registers.nvim',
    config = function()
      return require('plugins.tools.registers')
    end,
  },

  -- Marks
  {
    'kshenoy/vim-signature',
    config = function()
      return require('plugins.ui.signature')
    end,
  },

  -- Indentation
  {
    -- https://github.com/lukas-reineke/indent-blankline.nvim
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

  -- Scrolling
  {
    'karb94/neoscroll.nvim',
    config = function()
      return require('plugins.ui.neoscroll')
    end,
  },

  -- Git
  {
    {
      'tpope/vim-fugitive',
      cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' },
    },
    { 'tpope/vim-rhubarb' }, -- GitHub interaction
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
  },

  -- Tools ------------------------------------------------------------------------
  -- Search
  {
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
        'nvim-telescope/telescope-project.nvim'
      },
      init = function()
        return require('plugins.tools.telescope_setup')
      end,
      config = function()
        return require('plugins.tools.telescope')
      end,
      cmd = 'Telescope',
    },
  },
  -- {
  --   -- https://github.com/ibhagwan/fzf-lua
  --   'ibhagwan/fzf-lua',
  --   dependencies = {
  --     'vijaymarupudi/nvim-fzf',
  --     'nvim-tree/nvim-web-devicons' -- optional for icons
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
  --   'kyazdani42/nvim-tree.lua',
  --   dependencies = {
  --     'nvim-tree/nvim-web-devicons',
  --   },
  --   tag = 'nightly', -- optional, updated every week. (see issue #1193)
  --   init =[[lua require('plugins.tools.nvim-tree_setup')]],
  --   config = [[lua require('plugins.tools.nvim-tree')]],
  -- }
  {
    "ahmedkhalf/project.nvim",
    config = function()
      return require('plugins.tools.project-nvim')
    end
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v2.x",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      {
        -- only needed if you want to use the commands with "_with_window_picker" suffix
        's1n7ax/nvim-window-picker',
        version = "v1.*",
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

  -- -- {
  -- --   "luukvbaal/nnn.nvim",
  -- --   config = function() require("nnn").setup() end
  -- -- }

  -- Terminal
  {
    -- https://github.com/akinsho/toggleterm.nvim
    'akinsho/toggleterm.nvim',
    config = function()
      return require('plugins.tools.toggleterm')
    end,
  },

  -- -- Window management
  -- {
  --   -- https://github.com/mhinz/vim-sayonara
  --   'mhinz/vim-sayonara',
  -- },

  -- Spelling
  {
    'folke/which-key.nvim',
    config = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 500
      return require('plugins.tools.which-key')
    end,
  },

  -- Themes -----------------------------------------------------------------------
  -- {
  --   'nyngwang/nvimgelion',
  --   lazy = false, -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function ()
  --     -- do whatever you want for further customization~
  --     vim.cmd[[colors nvimgelion]]
  --   end
  -- },
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
  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 0.8, height = 0.8 },
    border = 'rounded',
    checker = {
      enabled = true,
    },
  }
})
