return {
  "telescope.nvim",
  opts = {
    defaults = {
      vertical = { width = 0.95 }
    },
    pickers = {
      colorscheme = {
        enable_preview = true
      },
    },
  },
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
      config = function()
        require("telescope").load_extension("fzf")
      end
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      config = function()
        require("telescope").load_extension "frecency"
      end,
    },
    {
      'nvim-telescope/telescope-ui-select.nvim',
      config = function()
        require("telescope").load_extension("ui-select")
      end
    },
    {
      'nvim-telescope/telescope-dap.nvim',
      config = function()
        require("telescope").load_extension("dap")
      end
    },
    {
      'nvim-telescope/telescope-file-browser.nvim',
      config = function()
        require("telescope").load_extension("file_browser")
      end
    },
    {
      'nvim-telescope/telescope-project.nvim',
      config = function()
        require("telescope").load_extension("project")
        require("telescope").load_extension("projects")
      end
    },
    {
      'nvim-telescope/telescope-media-files.nvim',
      config = function()
        require("telescope").load_extension("media_files")
      end
    },
    {
      'nvim-telescope/telescope-symbols.nvim',
    },
    {
      'nvim-telescope/telescope-github.nvim',
      config = function()
        require("telescope").load_extension("gh")
      end
    },
    {
      'tsakirist/telescope-lazy.nvim',
      config = function()
        require("telescope").load_extension("lazy")
      end
    }
  },
}