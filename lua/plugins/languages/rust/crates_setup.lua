-- Mappings
vim.api.nvim_set_keymap('n', '<leader>ct', [[<cmd>lua require('crates').toggle()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cr', [[<cmd>lua require('crates').reload()<cr>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>cv', [[<cmd>lua require('crates').show_versions_popup()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cf', [[<cmd>lua require('crates').show_features_popup()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cd', [[<cmd>lua require('crates').show_dependencies_popup()<cr>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>cu', [[<cmd>lua require('crates').update_crate()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>cu', [[<cmd>lua require('crates').upgrade_crates()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ca', [[<cmd>lua require('crates').update_all_crates()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cU', [[<cmd>lua require('crates').upgrade_crate()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>cU', [[<cmd>lua require('crates').upgrade_crates()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cA', [[<cmd>lua require('crates').upgrade_all_crates()<cr>]], { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<leader>cH', [[<cmd>lua require('crates').open_homepage()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cR', [[<cmd>lua require('crates').open_repository()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cD', [[<cmd>lua require('crates').open_documentation()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>cC', [[<cmd>lua require('crates').open_crates_io()<cr>]], { noremap = true, silent = true })