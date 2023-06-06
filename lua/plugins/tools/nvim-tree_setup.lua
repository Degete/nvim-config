-- Mappings
-- NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them
vim.keymap.set('n', '<C-n>', [[<cmd>lua require('nvim-tree').toggle(false)<cr>]], { noremap = true, silent = true, desc = "Toggle file explorer" })
vim.keymap.set('n', '<leader>r', [[<cmd>lua require('nvim-tree').refresh()<cr>]], { noremap = true, silent = true, desc = "Refresh file explorer" })
vim.keymap.set('n', '<leader>n', [[<cmd>lua require('nvim-tree').toggle(true)<cr>]], { noremap = true, silent = true, desc = "Toggle file explorer" })