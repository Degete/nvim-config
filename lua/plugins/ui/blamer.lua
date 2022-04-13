-- https://github.com/ttys3/nvim-blamer.lua

require'nvim-blamer'.setup({
  enable = true,
  format = '🙋 %committer │ ⏰ %committer-time-human │ %summary',
})

vim.call('nvimblamer#auto')