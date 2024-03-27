return {
  "telescope.nvim",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      dependencies = {
        'kkharji/sqlite.lua',
      },
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