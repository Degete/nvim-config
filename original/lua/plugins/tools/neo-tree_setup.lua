-- Mappings
vim.keymap.set('n', '<C-n>', [[<cmd>Neotree toggle<cr>]], { noremap = true, silent = true, desc = "Toggle file explorer" })
vim.keymap.set('n', '<leader>n', [[<cmd>Neotree<cr>]], { noremap = true, silent = true, desc = "Toggle file explorer" })

-- Unless you are still migrating, remove the deprecated commands from v1.x
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

-- If you want icons for diagnostic errors, you'll need to define them somewhere:
-- vim.fn.sign_define("DiagnosticSignError",
-- {text = " ", texthl = "DiagnosticSignError"})
-- vim.fn.sign_define("DiagnosticSignWarn",
-- {text = " ", texthl = "DiagnosticSignWarn"})
-- vim.fn.sign_define("DiagnosticSignInfo",
-- {text = " ", texthl = "DiagnosticSignInfo"})
-- vim.fn.sign_define("DiagnosticSignHint",
-- {text = "󰌵", texthl = "DiagnosticSignHint"})