-- Mappings
vim.keymap.set("n", "<leader>tn", "<cmd>TestNearest<cr>", { silent = true, noremap = true, desc = "Test nearest" })
vim.keymap.set("n", "<leader>tf", "<cmd>TestFile<cr>", { silent = true, noremap = true, desc = "Test file" })
vim.keymap.set("n", "<leader>ta", "<cmd>TestSuite<cr>", { silent = true, noremap = true, desc = "Test suite" })
vim.keymap.set("n", "<leader>tl", "<cmd>TestLast<cr>", { silent = true, noremap = true, desc = "Test last" })
vim.keymap.set("n", "<leader>tg", "<cmd>TestVisit<cr>", { silent = true, noremap = true, desc = "Test visit" })

-- Change execution strategy (https://github.com/vim-test/vim-test#strategies)
vim.cmd [[ let test#strategy = 'neovim' ]] -- 'dispatch', 'neovim', 'toggleterm', 'iterm'...
