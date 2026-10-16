return {
  -- https://github.com/catppuccin/nvim
  {
    "catppuccin/nvim",
    name = "catppuccin",
    -- lazy = false,
    -- priority = 1000,
    opts = {
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
      }
    },
  },

  -- https://github.com/projekt0n/github-nvim-theme
  {
    "projekt0n/github-nvim-theme",
    -- lazy = false,
    -- priority = 1000,
  },

  -- https://github.com/ellisonleao/gruvbox.nvim
  {
    "ellisonleao/gruvbox.nvim",
    -- lazy = false,
    -- priority = 1000,
    config = true,
  },

  -- https://github.com/rebelot/kanagawa.nvim
  {
    "rebelot/kanagawa.nvim",
    -- lazy = false,
    -- priority = 1000,
  },

  -- https://github.com/loctvl842/monokai-pro.nvim
  {
    "loctvl842/monokai-pro.nvim",
    -- lazy = false,
    -- priority = 1000,
  },

  -- https://github.com/gbprod/nord.nvim
  {
    "gbprod/nord.nvim",
    -- lazy = false,
    -- priority = 1000,
  },

  -- https://github.com/folke/tokyonight.nvim
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },

  -- Configure LazyVim to load a selected theme
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
