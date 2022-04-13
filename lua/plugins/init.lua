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

-- Install plugins
return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer Package Manager

  use 'lewis6991/impatient.nvim' -- Lua modules caching

  -- Async building & commands
  use {
    'tpope/vim-dispatch',
    cmd = { 'Dispatch', 'Make', 'Focus', 'Start' }
  }

  use { 'chaoren/vim-wordmotion', 'justinmk/vim-sneak' }
  
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
    run = ':TSUpdate',
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
      { 'hrsh7th/cmp-buffer', after = 'nvim-cmp' },
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      { 'hrsh7th/cmp-path', after = 'nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lua', after = 'nvim-cmp' },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp' },
      'lukas-reineke/cmp-under-comparator',
      { 'hrsh7th/cmp-nvim-lsp-document-symbol', after = 'nvim-cmp' },
    },
    config = [[require('plugins.code.cmp')]],
    event = 'InsertEnter *',
  }

  -- Text edition
  use {
    'ur4ltz/surround.nvim',
    config = [[require('plugins.code.surround')]],
  }

  -- Correction
  use {
    'kosayoda/nvim-lightbulb',
    config = [[require('plugins.code.lightbulb')]]
  }

  -- Debug
  use {
    -- https://github.com/mfussenegger/nvim-dap
    'mfussenegger/nvim-dap',
  }

  -- Quickfix
  use {
    -- https://github.com/kevinhwang91/nvim-bqf
    'kevinhwang91/nvim-bqf',
    ft = 'qf',
  }


  -- Language tools
  -- Rust
  use {
    -- https://github.com/simrat39/rust-tools.nvim
    'simrat39/rust-tools.nvim',
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
    keys = {
      { 'n', '"' },
      { 'i', '<c-r>' },
    },
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

  -- Git
  use {
    {
      'tpope/vim-fugitive',
      cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' },
      disable = true
    },
    { 'tpope/vim-rhubarb' }, -- GitHub interaction
    {
      'lewis6991/gitsigns.nvim',
      -- tag = 'release' -- To use the latest release
      requires = { 'nvim-lua/plenary.nvim' },
      config = [[require('plugins.ui.gitsigns')]],
    },
    -- {
    --   'ttys3/nvim-blamer.lua', -- git blame
    --   config = [[require('plugins.ui.blamer')]],
    -- },
  }

  -- Tools ------------------------------------------------------------------------
  -- Search
  -- use {
  --   {
  --     -- https://github.com/nvim-telescope/telescope.nvim
  --     'nvim-telescope/telescope.nvim',
  --     requires = {
  --       'nvim-lua/popup.nvim',
  --       'nvim-lua/plenary.nvim',
  --       'telescope-frecency.nvim',
  --       'telescope-fzf-native.nvim',
  --     },
  --     wants = {
  --       'popup.nvim',
  --       'plenary.nvim',
  --       'telescope-frecency.nvim',
  --       'telescope-fzf-native.nvim',
  --     },
  --     setup = [[require('plugins.tools.telescope_setup')]],
  --     config = [[require('plugins.tools.telescope')]],
  --     cmd = 'Telescope',
  --     module = 'telescope',
  --   },
  --   {
  --     'nvim-telescope/telescope-frecency.nvim',
  --     after = 'telescope.nvim',
  --     requires = 'tami5/sqlite.lua',
  --   },
  --   {
  --     'nvim-telescope/telescope-fzf-native.nvim',
  --     run = 'make',
  --   },
  -- }
  use {
    -- https://github.com/ibhagwan/fzf-lua
    'ibhagwan/fzf-lua',
    requires = {
      'vijaymarupudi/nvim-fzf',
      'kyazdani42/nvim-web-devicons' -- optional for icons
    },
    setup = [[require('plugins.tools.fzf-lua_setup')]],
    config = [[require('plugins.tools.fzf-lua')]],
  }

  -- Explorer
  use {
    -- https://github.com/kyazdani42/nvim-tree.lua
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    setup = [[require('plugins.tools.nvim-tree_setup')]],
    config = [[require('plugins.tools.nvim-tree')]],
  }

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

  -- Themes -----------------------------------------------------------------------
  use {
    -- https://github.com/projekt0n/github-nvim-theme
    'projekt0n/github-nvim-theme',
    config = [[require('plugins.themes.github')]],
  }
  use {
    -- https://github.com/arcticicestudio/nord-vim
    'arcticicestudio/nord-vim',
    config = [[require('plugins.themes.gruvbox')]],
  }
  use {
    -- https://github.com/morhetz/gruvbox
    'morhetz/gruvbox',
    config = [[require('plugins.themes.nord')]],
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
  
end)
