-- Mappings
-- NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them
vim.api.nvim_set_keymap('n', '<C-n>', [[<cmd>lua require('nvim-tree').toggle(false)<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>r', [[<cmd>lua require('nvim-tree').refresh()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>n', [[<cmd>lua require('nvim-tree').toggle(true)<cr>]], { noremap = true, silent = true })