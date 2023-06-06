-- Mappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Search files"})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Search within files" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Search buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Search tags"})
vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = "Color schemes" })
vim.keymap.set('n', '<leader>ft', builtin.tags, { desc = "Search tags" })
vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = "Search man pages" })
vim.keymap.set('n', '<leader>fi', builtin.lsp_implementations, { desc = "Search implementations" })
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = "Search references" })
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = "Search document symbols" })
vim.keymap.set('n', '<leader>fws', builtin.lsp_dynamic_workspace_symbols, { desc = "Search workspace symbols" })
vim.keymap.set('n', '<leader>fp', ":lua require('telescope').extensions.projects.projects{}<cr>", { desc = "Search recent workspaces" })
-- vim.keymap.set('n', '<M-CR>', builtin.lsp_code_actions)
vim.keymap.set('n', '<M-CR>', '<cmd>lua vim.lsp.buf.code_action()<cr>', { desc = "Show code actions" })