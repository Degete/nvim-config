-- https://github.com/nvim-telescope/telescope.nvim

-- use {
--   'nvim-telescope/telescope.nvim',
--   requires = { {'nvim-lua/plenary.nvim'} }
-- }

-- Config
local actions = require('telescope.actions')
local trouble = require("trouble.providers.telescope")

require('telescope').setup{
  defaults = {
    layout_strategy = 'flex',
    scroll_strategy = 'cycle',
    mappings = {
      i = {
        ["<esc>"] = actions.close,
        ["<c-t>"] = trouble.open_with_trouble,
      },
      n = {
        ["<c-t>"] = trouble.open_with_trouble,
      }
    }
  },
  pickers = {
    lsp_references = { theme = 'dropdown' },
    lsp_code_actions = { theme = 'dropdown' },
    lsp_definitions = { theme = 'dropdown' },
    lsp_implementations = { theme = 'dropdown' },
    buffers = {
      ignore_current_buffer = true,
      sort_mru = true,
      previewer = false,
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {},
    },
  },
}

-- Extensions
local telescope = require 'telescope'
telescope.load_extension 'frecency'
telescope.load_extension 'fzf'
telescope.load_extension 'ui-select'