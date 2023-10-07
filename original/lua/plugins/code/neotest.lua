-- https://github.com/nvim-neotest/neotest

require("neotest").setup({
  adapters = {
    require("neotest-vim-test") {
      ignore_file_types = {
        "vim",
        "lua",
        "python",
        "go",
        "rust",
        "vitest",
        "scala",
      },
    },
    require("neotest-plenary"),
    require("neotest-python"),
    require("neotest-go"),
    require("neotest-rust"),
    require('neotest-vitest'),
    require("neotest-scala"),
  },
})