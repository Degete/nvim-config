-- Mappings
local crates = require('crates')

vim.keymap.set('n', '<leader>ct', crates.toggle, { noremap = true, silent = true, desc = "Toggle Crates" })
vim.keymap.set('n', '<leader>cr', crates.reload, { noremap = true, silent = true, desc = "Reload Crates" })

vim.keymap.set('n', '<leader>cv', crates.show_versions_popup, { noremap = true, silent = true, desc = "Show versions" })
vim.keymap.set('n', '<leader>cf', crates.show_features_popup, { noremap = true, silent = true, desc = "Show features" })
vim.keymap.set('n', '<leader>cd', crates.show_dependencies_popup, { noremap = true, silent = true, desc = "Show dependencies" })

vim.keymap.set('n', '<leader>cu', crates.update_crate, { noremap = true, silent = true, desc = "Update crate" })
vim.keymap.set('v', '<leader>cu', crates.update_crates, { noremap = true, silent = true, desc = "Update crates" })
vim.keymap.set('n', '<leader>ca', crates.update_all_crates, { noremap = true, silent = true, desc = "Update all crates" })
vim.keymap.set('n', '<leader>cU', crates.upgrade_crate, { noremap = true, silent = true, desc = "Upgrade crate" })
vim.keymap.set('v', '<leader>cU', crates.upgrade_crates, { noremap = true, silent = true, desc = "Upgrade crates" })
vim.keymap.set('n', '<leader>cA', crates.upgrade_all_crates, { noremap = true, silent = true, desc = "Upgrade all crates" })

vim.keymap.set('n', '<leader>cH', crates.open_homepage, { noremap = true, silent = true, desc = "Open homepage" })
vim.keymap.set('n', '<leader>cR', crates.open_repository, { noremap = true, silent = true, desc = "Open repository" })
vim.keymap.set('n', '<leader>cD', crates.open_documentation, { noremap = true, silent = true, desc = "Open documentation" })
vim.keymap.set('n', '<leader>cC', crates.open_crates_io, { noremap = true, silent = true, desc = "Open crates.io" })