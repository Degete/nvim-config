-- Mappings
vim.keymap.set("n", "<leader>tn", "<cmd>lua require('neotest').run.run()<cr>", { silent = true, noremap = true, desc = "Test nearest" })
vim.keymap.set("n", "<leader>td", "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", { silent = true, noremap = true, desc = "Debug nearest test" })
vim.keymap.set("n", "<leader>tf", "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", { silent = true, noremap = true, desc = "Test file" })
vim.keymap.set("n", "<leader>ts", "<cmd>Neotest summary<cr>", { silent = true, noremap = true, desc = "Test summary" })