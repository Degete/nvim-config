-----------------------------------------------------------
-- General settings
-----------------------------------------------------------

-----------------------------------------------------------
-- Neovim API aliases
-----------------------------------------------------------
local map  = vim.api.nvim_set_keymap    -- Set global keymap
local cmd  = vim.cmd                    -- Execute Vim commands
local exec = vim.api.nvim_exec          -- Execute Vimscript
local fn   = vim.fn                     -- Call Vim functions
local g    = vim.g                      -- Global variables
local opt  = vim.opt                    -- Global/buffer/windows-scoped options

-----------------------------------------------------------
-- General
-----------------------------------------------------------
opt.mouse     = 'a'                     -- Enable mouse in all modes
opt.clipboard = 'unnamedplus'           -- Enable yank/delete to system clipboard
opt.swapfile  = true                    -- Enable swapfile
opt.undofile  = true                    -- Enable persistent undo

-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
opt.syntax        = 'enable'            -- Syntax highlighting
opt.number        = true                -- Show line number
opt.showmatch     = true                -- Highlight matching parenthesis
opt.foldmethod    = 'marker'            -- Enable folding (default 'foldmarker')
opt.colorcolumn   = '120'               -- Line length marker column
opt.splitright    = true                -- Vertical split to the right
opt.splitbelow    = true                -- Horizontal split to the bottom
opt.ignorecase    = true                -- Ignore case letters when search
opt.smartcase     = true                -- Ignore lowercase for the whole pattern
g.indentLine_char = '¦'                 -- Set indentLine character

-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
opt.hidden     = true                   -- Enable background buffers
opt.history    = 100                    -- Remember n lines in history
opt.lazyredraw = true                   -- Faster scrolling
opt.synmaxcol  = 240                    -- Max column for syntax highlight

-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
opt.termguicolors = true                -- Enable 24-bit RGB colors

-----------------------------------------------------------
-- Tabs, indent
-----------------------------------------------------------
opt.expandtab   = true                  -- Use spaces instead of tabs
opt.shiftwidth  = 4                     -- Shift 4 spaces when tab
opt.tabstop     = 4                     -- 1 tab == 4 spaces
opt.smartindent = true                  -- Autoindent new lines

-----------------------------------------------------------
-- Autocompletion
-----------------------------------------------------------
opt.completeopt = 'menuone,noselect,noinsert'   -- Completion options
opt.shortmess   = 'c' 	                        -- Don't show completion messages

-- Remove whitespaces on save
cmd[[au BufWritePre * :%s/\s\+$//e]]

-- Highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-- Don't auto commenting new lines
cmd[[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Remove line lenght marker for selected filetypes
cmd[[
  autocmd FileType text, markdown, xml, html, xhtml, javascript setlocal cc = 0
]]

-- 2 spaces for selected filetypes
cmd[[
  autocmd FileType xml, html, xhtml, css, scss, javascript, lua, yaml setlocal shiftwidth = 2 tabstop = 2
]]

-- Disable IndentLine for markdown files (avoid concealing)
cmd[[
	autocmd FileType markdown let g:indentLine_enabled = 0
]]

-- Remember cursor position
exec([[
  augroup remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif
  augroup END
]], false)


-- Autoformat on save
cmd[[
    autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
]]
