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
      },
      n = {
        ["<S-Up>"] = actions.preview_scrolling_up,
        ["<S-Down>"] = actions.preview_scrolling_down,
        ["<c-t>"] = trouble.open_with_trouble,
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
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = 'smart_case',
    },
    -- UI-Select extension
    ['ui-select'] = {
      require('telescope.themes').get_dropdown {},
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