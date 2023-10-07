--

return {
  "goolord/alpha-nvim",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")
    local logo = [[
       _   _         __     _____ __  __
      | \ | | ___  __\ \   / /_ _|  \/  |
      |  \| |/ _ \/ _ \ \ / / | || |\/| |
      | |\  |  __/ (_) \ V /  | || |  | |
      |_| \_|\___|\___/ \_/  |___|_|  |_|
    ]]

    dashboard.section.header.val = vim.split(logo, "\n")
  end
}