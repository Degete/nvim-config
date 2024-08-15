return {
  "nvimdev/dashboard-nvim",
  opts = {
    config = {
      header = vim.split(
        string.rep("\n", 8) ..
        [[
                 _       
 ___ ___ ___ _ _|_|_____ 
|   | -_| . | | | |     |
|_|_|___|___|\_/|_|_|_|_|
        ]]
        .. "\n\n", "\n"),
    },
  },
}
