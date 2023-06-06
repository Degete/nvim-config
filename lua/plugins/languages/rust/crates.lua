-- https://github.com/Saecki/crates.nvim

require('crates').setup({
    popup = {
        autofocus = true,
        show_version_date = true,
        border = 'rounded',
    }
})


-- -- nvim-cmp autocompletion lazy loading
-- vim.api.nvim_create_autocmd("BufRead", {
--     group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
--     pattern = "Cargo.toml",
--     callback = function()
--         cmp.setup.buffer({ sources = { { name = "crates" } } })
--     end,
-- })