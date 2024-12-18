return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- opts = function(_, opts)
    --   vim.list_extend(opts.ensure_installed, {
    --     -- "bash",
    --     -- "html",
    --     -- "javascript",
    --     -- "json",
    --     -- "lua",
    --     -- "markdown",
    --     -- "markdown_inline",
    --     -- "python",
    --     -- "query",
    --     -- "regex",
    --     -- "tsx",
    --     -- "typescript",
    --     -- "vim",
    --     -- "yaml",
    --   })
    -- end,
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-context' },
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
      { 'nvim-treesitter/nvim-treesitter-refactor' },
    },
  },
}