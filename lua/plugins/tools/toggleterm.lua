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
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

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

vim.keymap.set("n", "<leader>ot", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true, desc = "Open terminal" })
vim.keymap.set("n", "<leader>og", "<cmd>lua _lazygit_toggle()<cr>", { noremap = true, silent = true, desc = "Open lazygit" })
vim.keymap.set("n", "<leader>od", "<cmd>lua _lazydocker_toggle()<cr>", { noremap = true, silent = true, desc = "Open lazydocker" })