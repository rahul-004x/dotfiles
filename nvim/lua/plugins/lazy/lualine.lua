return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'SmiteshP/nvim-navic',
  },
  config = function()
    -- Setup navic for code context
    require("nvim-navic").setup({
      highlight = true,
      separator = " > ",
      depth_limit = 0,
      safe_output = true,
    })
    
    -- Make navic quiet
    vim.g.navic_silence = true
    
    -- Simple breadcrumbs function
    local function navic_breadcrumbs()
      local navic = require("nvim-navic")
      return navic.is_available() and (" " .. navic.get_location()) or ""
    end
    
    require('lualine').setup({
      options = {
        theme = 'catppuccin',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        globalstatus = true,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
          {
            'filename',
            path = 1, -- Show relative path
            shorting_target = 40,
            symbols = { modified = ' ●', readonly = ' ' },
            color = { fg = "#89b4fa" },
          },
          { 
            navic_breadcrumbs,
            color = { fg = "#5ba354ff" },
          },
        },
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
      }
    })
  end
}
