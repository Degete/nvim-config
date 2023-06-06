-- Moving lines
vim.keymap.set("n", "<M-Up>", "<cmd>:m .-2<cr>==", { noremap = true, silent = true, desc = "Move line up" })
vim.keymap.set("i", "<M-Up>", "<esc><cmd>:m .-2<cr>==gi", { noremap = true, silent = true, desc = "Move line up" })
vim.keymap.set("v", "<M-Up>", "<cmd>:m '<-2<cr>gv=gv", { noremap = true, silent = true, desc = "Move line up" })
vim.keymap.set("n", "<M-Down>", "<cmd>:m .+1<cr>==", { noremap = true, silent = true, desc = "" })
vim.keymap.set("i", "<M-Down>", "<esc><cmd>:m .+1<cr>==gi", { noremap = true, silent = true, desc = "Move line down" })
vim.keymap.set("v", "<M-Down>", "<cmd>:m '>+1<cr>gv=gv", { noremap = true, silent = true, desc = "Move line down" })