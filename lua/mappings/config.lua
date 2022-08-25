-- Leader key
vim.api.nvim_set_keymap("n", "<leader><leader>", "<cmd>:E ~/.nvim/lua/<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>a", "<cmd>:source $MYVIMRC<cr>", { noremap = true, silent = true })