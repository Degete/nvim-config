-- https://github.com/akinsho/toggleterm.nvim

-- Config
require("toggleterm").setup {
  persist_size = false,
  shade_terminals = true,
  close_on_exit = true,
  shell = vim.o.shell,
  direction = "float",
  float_opts = {
    border = "curved",
  },
}

-- Mappings
function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal  = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  hidden = true,
  direction = "tab",
})
local lazydocker = Terminal:new({
  cmd = "lazydocker",
  hidden = true,
  direction = "tab",
})

function _lazygit_toggle()
  lazygit:toggle()
end

function _lazydocker_toggle()
  lazydocker:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>lg", "<cmd>lua _lazygit_toggle()<cr>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>ld", "<cmd>lua _lazydocker_toggle()<cr>", { noremap = true, silent = true })