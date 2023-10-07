-- Leader key
vim.keymap.set("n", "<leader><leader>", "<cmd>:E ~/.nvim/lua/<cr>", { noremap = true, silent = true, desc = "Edit config" })
vim.keymap.set("n", "<leader>a", "<cmd>:source $MYVIMRC<cr>", { noremap = true, silent = true, desc = "Reload config" })