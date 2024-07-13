return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    window = {
      mappings = {
        ["P"] = { "toggle_preview", config = {use_float = false} }
      },
    },
  },
  {
    "echasnovski/mini.surround",
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      },
    },
  },
}
