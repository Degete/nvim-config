-- Open NeoTree automatically after a session is load
-- local config_group = vim.api.nvim_create_augroup('MyConfigGroup', {}) -- A global group for all your config autocommands

-- vim.api.nvim_create_autocmd({ 'User' }, {
--   pattern = "SessionLoadPost",
--   group = config_group,
--   callback = function()
--     vim.cmd [[Neotree]]
--   end,
-- })

-- Save session on save buffer
-- vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
--   group = config_group,
--   callback = function ()
--     if vim.bo.filetype ~= 'git'
--       and not vim.bo.filetype ~= 'gitcommit'
--       and not vim.bo.filetype ~= 'gitrebase'
--       then session_manager.autosave_session() end
--   end
-- })