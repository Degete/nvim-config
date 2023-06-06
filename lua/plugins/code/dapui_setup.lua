-- Mappings
vim.keymap.set('n', '<leader>dU', [[<cmd>lua require('dapui').toggle()<cr>]], { noremap = true, silent = true, desc = "Toggle DAP UI" })
vim.keymap.set('n', '<leader>di', [[<cmd>lua require('dapui').float_element()<cr>]], { noremap = true, silent = true, desc = "Show element information in a window" })
vim.keymap.set({ 'n', 'v' }, '<leader>de', [[<cmd>lua require('dapui').eval()<cr>]], { noremap = true, silent = true, desc = "Evaluate expression" })
vim.keymap.set('n', '<leader>dE', [[<cmd>lua require('dapui').eval(vim.fn.input "[Expression]: ")<cr>]], { noremap = true, silent = true, desc = "Evaluate expression with input" })
vim.keymap.set('n', '<leader>dh', [[<cmd>lua require('dap.ui.widgets').hover()<cr>]], { noremap = true, silent = true, desc = "Show hover variables expression" })
vim.keymap.set('n', '<leader>dS', [[<cmd>lua require('dap.ui.widgets').scopes()<cr>]], { noremap = true, silent = true, desc = "Show scopes" })