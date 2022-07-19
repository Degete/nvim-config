vim.cmd [[command! BreakpointToggle lua require('dap').toggle_breakpoint()]]
vim.cmd [[command! Debug lua require('dap').continue()]]

vim.api.nvim_set_keymap('n', '<F5>', [[<cmd>lua require('dap').continue()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F6>', [[<cmd>lua require('dap').step_over()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F7>', [[<cmd>lua require('dap').step_into()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<F8>', [[<cmd>lua require('dap').step_out()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>b', [[<cmd>lua require('dap').toggle_breakpoint()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<M-b>', [[<cmd>lua require('dap').toggle_breakpoint()<cr>]], { noremap = true, silent = true })