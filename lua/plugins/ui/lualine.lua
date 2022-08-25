-- https://github.com/hoob3rt/lualine.nvim

-- use {
--   'hoob3rt/lualine.nvim',
--   requires = {'kyazdani42/nvim-web-devicons', opt = true}
-- }

require('lualine').setup({
  options = {
    -- Themes
    -- https://github.com/hoob3rt/lualine.nvim/blob/master/THEMES.md
    -- theme = 'ayu_light',
    -- theme = 'ayu_dark',
    -- theme = 'github_light',
    -- theme = 'tokyonight',
    theme = 'auto',

    -- Separators
    section_separators = {'', ''},
    component_separators = {'', ''},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { require'tabline'.tabline_buffers },
    lualine_x = { require'tabline'.tabline_tabs },
    lualine_y = {},
    lualine_z = {}
  },
})
