-- https://github.com/kyazdani42/nvim-tree.lua

local function my_on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
  vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
  vim.keymap.set('n', '<C-n>', api.tree.toggle, opts("Toggle file explorer"))
  vim.keymap.set('n', '<leader>r', api.tree.reload, opts("Refresh file explorer"))
  vim.keymap.set('n', '<leader>n', api.tree.toggle, opts("Toggle file explorer"))
end

require("nvim-tree").setup({
  on_attach = my_on_attach
})