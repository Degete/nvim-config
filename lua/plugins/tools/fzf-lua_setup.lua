-- Mappings
opts = {
  winopts = {
    win_height = 1, -- window height
    win_width = 1, -- window width
  }
}
vim.keymap.set('n', '<leader>ff', [[<cmd>lua require('fzf-lua').files(opts)<cr>]], { noremap = true, silent = true, desc = "Search files" })
vim.keymap.set('n', '<leader>fg', [[<cmd>lua require('fzf-lua').live_grep(opts)<cr>]], { noremap = true, silent = true, desc = "Search within files" })
vim.keymap.set('n', '<leader>fb', [[<cmd>lua require('fzf-lua').buffers(opts)<cr>]], { noremap = true, silent = true, desc = "Search buffers" })
vim.keymap.set('n', '<leader>fc', [[<cmd>lua require('fzf-lua').colorschemes()<cr>]], { noremap = true, silent = true, desc = "Color schemes" })
vim.keymap.set('n', '<leader>ft', [[<cmd>lua require('fzf-lua').tags(opts)<cr>]], { noremap = true, silent = true, "Search tags" })
vim.keymap.set('n', '<leader>fr', [[<cmd>lua require('fzf-lua').lsp_references(opts)<cr>]], { noremap = true, silent = true, desc = "Search references" })
vim.keymap.set('n', '<leader>fs', [[<cmd>lua require('fzf-lua').lsp_document_symbols(opts)<cr>]], { noremap = true, silent = true, desc = "Search document symbols" })
vim.keymap.set('n', '<leader>fws', [[<cmd>lua require('fzf-lua').lsp_workspace_symbols(opts)<cr>]], { noremap = true, silent = true, desc = "Search workspace symbols" })
vim.keymap.set('n', '<M-CR>', [[<cmd>lua require('fzf-lua').lsp_code_actions()<cr>]], { noremap = true, silent = true, desc = "Show code actions" })