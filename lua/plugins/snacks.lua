-- https://github.com/folke/snacks.nvim

return {
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
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
