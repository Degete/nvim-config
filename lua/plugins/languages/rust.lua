-- https://github.com/simrat39/rust-tools.nvim
-- use {'simrat39/rust-tools.nvim' }

require('rust-tools').setup({
  dap = {
    adapter = {
      type = "executable",
      command = '/usr/local/opt/llvm/bin/lldb-vscode',
      name = "lldb"
    }
  }
})