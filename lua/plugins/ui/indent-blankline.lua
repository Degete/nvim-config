-- https://github.com/lukas-reineke/indent-blankline.nvim

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
    filetype_exclude = { "dashboard" },
}