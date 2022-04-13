-- Buffer control

vim.api.nvim_set_keymap("n", "<leader>v", "<cmd>:vsplit<cr>", { noremap = true, silent = true })            -- Split vertically
vim.api.nvim_set_keymap("n", "<leader>h", "<cmd>:split<cr>", { noremap = true, silent = true })             -- Split horizontally
vim.api.nvim_set_keymap("n", "<leader>q", "<cmd>:bd<cr>", { noremap = true, silent = true })                -- Close buffer
vim.api.nvim_set_keymap("n", "<S-Left>", "<cmd>:bp<cr>", { noremap = true, silent = true })                 -- Move to previous buffer
vim.api.nvim_set_keymap("n", "<S-Right>", "<cmd>:bn<cr>", { noremap = true, silent = true })                -- Move to next buffer
vim.api.nvim_set_keymap("n", "<S-Right>", "<cmd>:bn<cr>", { noremap = true, silent = true })                -- Move to previous window
vim.api.nvim_set_keymap("n", "<S-Right>", "<cmd>:bn<cr>", { noremap = true, silent = true })                -- Move to next window
vim.api.nvim_set_keymap("n", "<C-S-Left>", "<cmd>:tabprevious<cr>", { noremap = true, silent = true })      -- Move to previous tab
vim.api.nvim_set_keymap("n", "<C-S-Right>", "<cmd>:tabnext<cr>", { noremap = true, silent = true })         -- Move to next tab
