local lualine = require("lualine")

lualine.setup({
  options = {
    theme = "catppuccin-mocha",
    section_separators = { left = "", right = "" },
    component_separators = "",
  },
  sections = {
    lualine_a = { 
      {
        "mode", 
        icon = { 
          ""
        },
        colored = false
      }
    },
    lualine_b = {},
    lualine_c = { 
      {
        "progress", 
        padding = { left = 1, right = 0 }
      }, 
      {
        "location", 
        padding = { left = 0 }
      } 
    },
    lualine_x = {},
    lualine_y = { 
      {
        "fileformat",
        padding = { left = 1, right = 2 }
      } 
    },
    lualine_z = { 
      {
        "filetype", 
        icon_only = true,
        colored = false,
        padding = { 
          left = 1, 
          right = 0
        }
      },
      {
        "filename", 
        padding = {
          left = 0, 
          right = 1
        }
      } 
    }
  }
})
