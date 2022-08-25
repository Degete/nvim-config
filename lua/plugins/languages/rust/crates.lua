-- https://github.com/Saecki/crates.nvim
-- use {
--     'saecki/crates.nvim',
--     event = { "BufRead Cargo.toml" },
--     requires = { { 'nvim-lua/plenary.nvim' } },
--     config = function()
--         require('crates').setup()
--     end,
-- }

require('crates').setup()


-- nvim-cmp autocompletion lazy loading
-- vim.api.nvim_create_autocmd("BufRead", {
--     group = vim.api.nvim_create_augroup("CmpSourceCargo", { clear = true }),
--     pattern = "Cargo.toml",
--     callback = function()
--         cmp.setup.buffer({ sources = { { name = "crates" } } })
--     end,
-- })