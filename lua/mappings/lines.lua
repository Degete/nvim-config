-- Moving lines

vim.api.nvim_set_keymap("n", "<M-Down>", "<cmd>:m .+1<cr>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<M-Up>", "<cmd>:m .-2<cr>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-Down>", "<cmd><esc>:m .+1<cr>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<M-Up>", "<cmd><Esc>:m .-2<cr>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<M-Down>", "<cmd>:m '>+1<cr>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<M-Up>", "<cmd>:m '<-2<cr>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<T-Down>", "<cmd>:m .+1<cr>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<T-Up>", "<cmd>:m .-2<cr>==", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<T-Down>", "<cmd><Esc>:m .+1<cr>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("i", "<T-Up>", "<cmd><Esc>:m .-2<cr>==gi", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<T-Down>", "<cmd>:m '>+1<cr>gv=gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<T-Up>", "<cmd>:m '<-2<cr>gv=gv", { noremap = true, silent = true })