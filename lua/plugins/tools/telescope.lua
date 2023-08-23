-- https://github.com/nvim-telescope/telescope.nvim

-- Config
local actions = require('telescope.actions')
local trouble = require("trouble.providers.telescope")
local project_actions = require("telescope._extensions.project.actions")

require('telescope').setup{
  defaults = {
    layout_strategy = 'flex',
    scroll_strategy = 'cycle',
    mappings = {
      i = {
        ["<S-Up>"] = actions.preview_scrolling_up,
        ["<S-Down>"] = actions.preview_scrolling_down,
        ["<c-t>"] = trouble.open_with_trouble,
        ["<C-h>"] = "which_key",
        ["?"] = "which_key",
      },
      n = {
        ["<S-Up>"] = actions.preview_scrolling_up,
        ["<S-Down>"] = actions.preview_scrolling_down,
        ["<c-t>"] = trouble.open_with_trouble,
        ["<C-h>"] = "which_key",
        ["?"] = "which_key",
      }
    }
  },
  pickers = {
    buffers = {
      ignore_current_buffer = true,
      sort_mru = true,
      previewer = false,
    },
    colorscheme = {
      enable_preview = true
    },
  },
  extensions = {
    -- FZF Extension
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
    -- UI-Select extension
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {},
    },
    -- Frecency
    frecency = {
      show_scores = false,
      show_unindexed = true,
    },
    -- File Browser extension
    file_browser = {
      theme = "ivy",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
    -- Project extension
    project = {
      base_dirs = {
      },
      hidden_files = true, -- default: false
      theme = "dropdown",
      order_by = "recent",
      search_by = "title",
      sync_with_nvim_tree = false, -- default false
      -- default for on_project_selected = find project files
      on_project_selected = function(prompt_bufnr)
        -- Do anything you want in here. For example:
        project_actions.change_working_directory(prompt_bufnr, false)
      end
    }
  },
}

-- Extensions
local telescope = require('telescope')
telescope.load_extension('frecency')
telescope.load_extension('fzf')
telescope.load_extension('ui-select')
telescope.load_extension('dap')
telescope.load_extension('file_browser')
telescope.load_extension('project')
telescope.load_extension('projects')
telescope.load_extension('media_files')
telescope.load_extension('gh')