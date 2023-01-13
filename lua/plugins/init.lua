-- Check and install Packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

-- Reload if any config file has been modified
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost ~/.nvim/** source $MYVIMRC | PackerCompile
  augroup end
]])

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

-- Install plugins
return require('packer').startup({function(use)
  use 'wbthomason/packer.nvim' -- Packer Package Manager

  use 'lewis6991/impatient.nvim' -- Lua modules caching

  -- Dashboard
  -- use 'glepnir/dashboard-nvim'

  -- Async building & commands
  use {
    'tpope/vim-dispatch',
    opt = true,
    cmd = { 'Dispatch', 'Make', 'Focus', 'Start' }
  }

  -- Sessions ---------------------------------------------------------------------
  -- use {
  --   'dhruvasagar/vim-prosession',
  --   after = 'vim-obsession',
  --   requires = {{ 'tpope/vim-obsession', cmd = 'Prosession' }},
  --   config = [[require('plugins.tools.prosession')]],
  -- }
  use {
    'Shatur/neovim-session-manager',
    setup = [[require('plugins.tools.session-manager_setup')]],
    config = [[require('plugins.tools.session-manager')]],
  }

  -- Code -------------------------------------------------------------------------
  -- Treesitter
  use {
    -- https://github.com/nvim-treesitter/nvim-treesitter
    'nvim-treesitter/nvim-treesitter',
    requires = {
      -- https://github.com/nvim-treesitter/nvim-treesitter-refactor
      'nvim-treesitter/nvim-treesitter-refactor',
      -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = [[require('plugins.code.treesitter')]],
  }

  -- LSP
  use {
    -- https://github.com/neovim/nvim-lspconfig
    'neovim/nvim-lspconfig',
    config = [[require('plugins.code.lspconfig')]],
  }

  -- Autocomplete
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { 'L3MON4D3/LuaSnip' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-cmdline', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      'lukas-reineke/cmp-under-comparator',
      { 'hrsh7th/cmp-nvim-lsp-document-symbol', after = 'nvim-cmp' },
      {
        'windwp/nvim-autopairs',
        config = [[require('plugins.code.autopairs')]],
      }
    },
    config = [[require('plugins.code.cmp')]],
    event = 'InsertEnter *',
  }

  -- Navigation
  use { 'chaoren/vim-wordmotion' }
  use {
    'justinmk/vim-sneak',
    config = [[require('plugins.code.sneak')]]
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Text edition
  use {
    'ur4ltz/surround.nvim',
    config = [[require('plugins.code.surround')]],
  }

  -- Correction
  use {
    'kosayoda/nvim-lightbulb',
    requires = { 'antoinemadec/FixCursorHold.nvim' },
    config = [[require('plugins.code.lightbulb')]]
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    setup = [[require('plugins.code.trouble_setup')]],
    config = [[require('plugins.code.trouble')]]
  }

  -- Debug
  use {
    -- https://github.com/mfussenegger/nvim-dap
    'mfussenegger/nvim-dap',
    setup = [[require('plugins.code.dap_setup')]],
    config = [[require('plugins.code.dap')]],
    requires = {
      'jbyuki/one-small-step-for-vimkind',
    },
    wants = {
      'one-small-step-for-vimkind',
    },
    module = 'dap',
  }
  use {
    "rcarriga/nvim-dap-ui",
    requires = { "nvim-dap" },
    after = { "nvim-dap" },
    config = [[require('plugins.code.dapui')]],
  }
  use {
    'theHamsta/nvim-dap-virtual-text',
    config = [[require('plugins.code.dap-virtual-text')]],
  }

  -- Quickfix
  -- use {
  --   -- https://github.com/kevinhwang91/nvim-bqf
  --   'kevinhwang91/nvim-bqf',
  --   ft = 'qf',
  -- }

  -- Language tools
  -- Rust
  use {
    -- https://github.com/simrat39/rust-tools.nvim
    'simrat39/rust-tools.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = [[require('plugins.languages.rust.rust-tools')]],
  }
  use {
    'saecki/crates.nvim',
    -- tag = 'v0.2.1',
    -- event = { "BufRead Cargo.toml" },
    requires = { 'nvim-lua/plenary.nvim' },
    setup = [[require('plugins.languages.rust.crates_setup')]],
    config = [[require('plugins.languages.rust.crates')]],
  }

  -- UI ---------------------------------------------------------------------------
  -- Dev icons
  use {
    -- https://github.com/kyazdani42/nvim-web-devicons
    'kyazdani42/nvim-web-devicons',
  }

  -- Buffers
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'kyazdani42/nvim-web-devicons',
    config = [[require('plugins.ui.bufferline')]],
  }
  -- use({
  --   'noib3/nvim-cokeline',
  --   requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
  --   config = [[require('plugins.ui.cokeline')]],
  -- })

  -- Statusline
  use {
    'hoob3rt/lualine.nvim',
    after = "github-nvim-theme",
    requires = {
      { 'kyazdani42/nvim-web-devicons', opt = true },
    },
    config = [[require('plugins.ui.lualine')]],
  }
  use {
    'kdheepak/tabline.nvim',
    requires = {
      { 'hoob3rt/lualine.nvim', opt = true },
      { 'kyazdani42/nvim-web-devicons', opt = true },
    },
    config = [[require('plugins.ui.tabline')]],
  }

  -- Registers
  -- use {
  --   'junegunn/vim-peekaboo',
  -- }
  use {
    -- https://github.com/tversteeg/registers.nvim
    'tversteeg/registers.nvim',
    config = [[require('plugins.tools.registers')]]
  }

  -- Marks
  use {
    'kshenoy/vim-signature',
    config = [[require('plugins.ui.signature')]],
    disable = true,
  }

  -- Indentation
  use {
    -- https://github.com/lukas-reineke/indent-blankline.nvim
    'lukas-reineke/indent-blankline.nvim',
    config = [[require('plugins.ui.indent-blankline')]],
  }

  -- Colorizer
  use {
    'norcalli/nvim-colorizer.lua',
    config = [[require('plugins.ui.colorizer')]],
  }

  -- Scrolling
  use {
    'karb94/neoscroll.nvim',
    config = [[require('plugins.ui.neoscroll')]],
  }

  -- Git
  use {
    {
      'tpope/vim-fugitive',
      cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' },
      disable = false
    },
    { 'tpope/vim-rhubarb' }, -- GitHub interaction
    {
      'lewis6991/gitsigns.nvim',
      -- tag = 'release' -- To use the latest release
      requires = { 'nvim-lua/plenary.nvim' },
      config = [[require('plugins.ui.gitsigns')]],
    },
    {
      'sindrets/diffview.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = [[require('plugins.tools.diffview')]],
    }
  }

  -- Tools ------------------------------------------------------------------------
  -- Search
  use {
    {
      -- https://github.com/nvim-telescope/telescope.nvim
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
      },
      wants = {
        'popup.nvim',
        'plenary.nvim',
        'telescope-frecency.nvim',
        'telescope-fzf-native.nvim',
      },
      setup = [[require('plugins.tools.telescope_setup')]],
      config = [[require('plugins.tools.telescope')]],
      cmd = 'Telescope',
      module = 'telescope',
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      after = 'telescope.nvim',
      requires = 'tami5/sqlite.lua',
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'make',
    },
  }
  use {
    -- https://github.com/ibhagwan/fzf-lua
    'ibhagwan/fzf-lua',
    requires = {
      'vijaymarupudi/nvim-fzf',
      'kyazdani42/nvim-web-devicons' -- optional for icons
    },
    -- setup = [[require('plugins.tools.fzf-lua_setup')]],
    config = [[require('plugins.tools.fzf-lua')]],
  }

  -- Explorer
  -- use {
  --   -- https://github.com/kyazdani42/nvim-tree.lua
  --   'kyazdani42/nvim-tree.lua',
  --   requires = {
  --     'kyazdani42/nvim-web-devicons',
  --   },
  --   tag = 'nightly', -- optional, updated every week. (see issue #1193)
  --   setup = [[require('plugins.tools.nvim-tree_setup')]],
  --   config = [[require('plugins.tools.nvim-tree')]],
  -- }
  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    setup = [[require('plugins.tools.neo-tree_setup')]],
    config = [[require('plugins.tools.neo-tree')]],
  }

  -- use {
  --   "luukvbaal/nnn.nvim",
  --   config = function() require("nnn").setup() end
  -- }

  -- Terminal
  use {
    -- https://github.com/akinsho/toggleterm.nvim
    'akinsho/toggleterm.nvim',
    config = [[require('plugins.tools.toggleterm')]],
  }

  -- Window management
  use {
    -- https://github.com/mhinz/vim-sayonara
    'mhinz/vim-sayonara',
  }

  -- Spelling
  use {
    "folke/which-key.nvim",
    config = [[require('plugins.tools.which-key')]],
  }

  -- Themes -----------------------------------------------------------------------
  use {
    -- https://github.com/projekt0n/github-nvim-theme
    'projekt0n/github-nvim-theme',
    config = [[require('plugins.themes.github')]],
  }
  use {
    -- https://github.com/arcticicestudio/nord-vim
    'arcticicestudio/nord-vim',
    config = [[require('plugins.themes.nord')]],
  }
  use {
    -- https://github.com/morhetz/gruvbox
    'morhetz/gruvbox',
    config = [[require('plugins.themes.gruvbox')]],
  }
  use {
    -- https://github.com/folke/tokyonight.nvim
    'folke/tokyonight.nvim',
    config = [[require('plugins.themes.tokyonight')]],
  }

  -- Packer -----------------------------------------------------------------------
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end

end,
config = {
  ensure_dependencies   = true, -- Should packer install plugin dependencies?
  snapshot = nil, -- Name of the snapshot you would like to load at startup
  plugin_package = 'packer', -- The default package for plugins
  max_jobs = nil, -- Limit the number of simultaneous jobs. nil means no limit
  auto_clean = true, -- During sync(), remove unused plugins
  compile_on_sync = true, -- During sync(), run packer.compile()
  disable_commands = false, -- Disable creating commands
  opt_default = false, -- Default to using opt (as opposed to start) plugins
  transitive_opt = true, -- Make dependencies of opt plugins also opt by default
  transitive_disable = true, -- Automatically disable dependencies of disabled plugins
  auto_reload_compiled = true, -- Automatically reload the compiled file after creating it.
  git = {
    cmd = 'git', -- The base command for git operations
    subcommands = { -- Format strings for git subcommands
      update         = 'pull --ff-only --progress --rebase=false',
      install        = 'clone --depth %i --no-single-branch --progress',
      fetch          = 'fetch --depth 999999 --progress',
      checkout       = 'checkout %s --',
      update_branch  = 'merge --ff-only @{u}',
      current_branch = 'branch --show-current',
      diff           = 'log --color=never --pretty=format:FMT --no-show-signature HEAD@{1}...HEAD',
      diff_fmt       = '%%h %%s (%%cr)',
      get_rev        = 'rev-parse --short HEAD',
      get_msg        = 'log --color=never --pretty=format:FMT --no-show-signature HEAD -n 1',
      submodules     = 'submodule update --init --recursive --progress'
    },
    depth = 1, -- Git clone depth
    clone_timeout = 60, -- Timeout, in seconds, for git clones
    default_url_format = 'https://github.com/%s' -- Lua format string used for "aaa/bbb" style plugins
  },
  display = {
    non_interactive = false, -- If true, disable display windows for all operations
    -- open_fn  = nil, -- An optional function to open a window for packer's display
    open_fn = function()
      return require('packer.util').float({ border = 'single' })
    end,
    open_cmd = '65vnew \\[packer\\]', -- An optional command to open a window for packer's display
    working_sym = '⟳', -- The symbol for a plugin being installed/updated
    error_sym = '✗', -- The symbol for a plugin with an error in installation/updating
    done_sym = '✓', -- The symbol for a plugin which has completed installation/updating
    removed_sym = '-', -- The symbol for an unused plugin which was removed
    moved_sym = '→', -- The symbol for a plugin which was moved (e.g. from opt to start)
    header_sym = '━', -- The symbol for the header line in packer's display
    show_all_info = true, -- Should packer show all update details automatically?
    prompt_border = 'double', -- Border style of prompt popups.
    keybindings = { -- Keybindings for the display window
      quit = 'q',
      toggle_info = '<CR>',
      diff = 'd',
      prompt_revert = 'r',
    }
  },
  luarocks = {
    python_cmd = 'python' -- Set the python command to use for running hererocks
  },
  log = { level = 'warn' }, -- The default print log level. One of: "trace", "debug", "info", "warn", "error", "fatal".
  profile = {
    enable = false,
    threshold = 0.5, -- integer in milliseconds, plugins which load faster than this won't be shown in profile output
  },
  autoremove = true, -- Remove disabled or unused plugins without prompting the user
}})
