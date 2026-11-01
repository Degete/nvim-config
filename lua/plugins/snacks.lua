-- https://github.com/folke/snacks.nvim

return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      picker = {
        layouts = {
          default = { layout = { width = 0.95, height = 0.9, min_width = 0 } },
          vertical = { layout = { width = 0.95, height = 0.9, min_width = 0, min_height = 0 } },
        },
      },
      dashboard = {
        -- your dashboard configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        -- example = "github",
        sections = {
          {
            section = "terminal",
            cmd = "echo neovim | figlet | lolcat",
            height = 6,
            indent = 12,
          },
          { section = "keys", gap = 1, padding = 1 },
          { section = "startup" },
        },
      },
    },
  },
}
