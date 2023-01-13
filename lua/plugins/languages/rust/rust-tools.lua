-- https://github.com/simrat39/rust-tools.nvim
-- use {'simrat39/rust-tools.nvim' }

local rt = require("rust-tools")

rt.setup({
  dap = {
    adapter = {
      type = "executable",
      command = '/opt/homebrew/opt/llvm/bin/lldb-vscode',
      name = "lldb"
    }
  },
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
