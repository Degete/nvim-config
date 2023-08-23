-- Mappings
vim.keymap.set('n', '<leader>db', [[<cmd>lua require('dap').toggle_breakpoint()<cr>]], { noremap = true, silent = true, desc = 'Toggle breakpoint' })
vim.keymap.set('n', '<leader>dB', [[<cmd>lua require('dap').set_breakpoint(vim.fn.input '[Condition]: ')<cr>]], { noremap = true, silent = true, desc = 'Conditional breakpoint' })
vim.keymap.set('n', '<leader>dr', [[<cmd>lua require('dap').run_to_cursor()<cr>]], { noremap = true, silent = true, desc = 'Run to cursor' })
vim.keymap.set('n', '<leader>dsb', [[<cmd>lua require('dap').step_back()<cr>]], { noremap = true, silent = true, desc = 'Step back' })
vim.keymap.set('n', '<F5>', [[<cmd>lua require('dap').continue()<cr>]], { noremap = true, silent = true, desc = 'Continue debugging' })
vim.keymap.set('n', '<F6>', [[<cmd>lua require('dap').step_over()<cr>]], { noremap = true, silent = true, desc = 'Step over' })
vim.keymap.set('n', '<leader>do', [[<cmd>lua require('dap').step_over()<cr>]], { noremap = true, silent = true, desc = 'Step over' })
vim.keymap.set('n', '<leader>di', [[<cmd>lua require('dap').into()<cr>]], { noremap = true, silent = true, desc = 'Step into' })
vim.keymap.set('n', '<F7>', [[<cmd>lua require('dap').step_into()<cr>]], { noremap = true, silent = true, desc = 'Step into' })
vim.keymap.set('n', '<leader>dso', [[<cmd>lua require('dap').step_out()<cr>]], { noremap = true, silent = true, desc = 'Step out' })
vim.keymap.set('n', '<F8>', [[<cmd>lua require('dap').step_out()<cr>]], { noremap = true, silent = true, desc = 'Step out' })
vim.keymap.set('n', '<leader>dc', [[<cmd>lua require('dap').continue()<cr>]], { noremap = true, silent = true, desc = 'Start/Continue' })
vim.keymap.set('n', '<leader>dp', [[<cmd>lua require('dap').pause.toggle()<cr>]], { noremap = true, silent = true, desc = 'Pause' })
vim.keymap.set('n', '<leader>dd', [[<cmd>lua require('dap').disconnect()<cr>]], { noremap = true, silent = true, desc = 'Disconnect' })
vim.keymap.set('n', '<leader>dx', [[<cmd>lua require('dap').terminate()<cr>]], { noremap = true, silent = true, desc = 'Terminate session' })
vim.keymap.set('n', '<leader>dg', [[<cmd>lua require('dap').session()<cr>]], { noremap = true, silent = true, desc = 'Get session' })
vim.keymap.set('n', '<leader>dR', [[<cmd>lua require('dap').repl.toggle()<cr>]], { noremap = true, silent = true, desc = 'Toggle REPL' })

vim.cmd [[command! BreakpointToggle lua require('dap').toggle_breakpoint()]]
vim.cmd [[command! Debug lua require('dap').continue()]]

-- Set colors
vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = 'red', bg = '' })
vim.api.nvim_set_hl(0, 'DapBreakpointCondition', { ctermbg = 0, fg = 'red', bg = '' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = 'gray', bg = '' })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = 'green', bg = '' })
vim.api.nvim_set_hl(0, 'DapBreakpointRejected', { ctermbg = 0, fg = 'blue', bg = '' })

-- Set icons
vim.fn.sign_define('DapBreakpoint', { text='', texthl='DapBreakpoint', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointCondition', { text='', texthl='DapBreakpointCondition', linehl='', numhl='' })
vim.fn.sign_define('DapLogPoint', { text='', texthl='DapLogPoint', linehl='', numhl='' })
vim.fn.sign_define('DapStopped', { text='', texthl='DapStopped', linehl='', numhl='' })
vim.fn.sign_define('DapBreakpointRejected', { text='', texthl='DapBreakpointRejected', linehl='', numhl='' })