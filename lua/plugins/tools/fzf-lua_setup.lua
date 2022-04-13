-- Mappings
opts = {
  winopts = {
    win_height = 1, -- window height
    win_width = 1, -- window width
  }
}
vim.api.nvim_set_keymap('n', '<leader>ff', [[<cmd>lua require('fzf-lua').files(opts)<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fg', [[<cmd>lua require('fzf-lua').live_grep(opts)<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fb', [[<cmd>lua require('fzf-lua').buffers(opts)<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fc', [[<cmd>lua require('fzf-lua').colorschemes()<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ft', [[<cmd>lua require('fzf-lua').tags(opts)<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fr', [[<cmd>lua require('fzf-lua').lsp_references(opts)<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fs', [[<cmd>lua require('fzf-lua').lsp_document_symbols(opts)<cr>]], { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>fws', [[<cmd>lua require('fzf-lua').lsp_workspace_symbols(opts)<cr>]], { noremap = true, silent = true })