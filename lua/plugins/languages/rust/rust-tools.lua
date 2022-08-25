-- https://github.com/simrat39/rust-tools.nvim
-- use {'simrat39/rust-tools.nvim' }

require('rust-tools').setup({
  dap = {
    adapter = {
      type = "executable",
      command = '/opt/homebrew/opt/llvm/bin/lldb-vscode',
      name = "lldb"
    }
  }
})
