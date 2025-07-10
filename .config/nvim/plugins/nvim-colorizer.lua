return {
  "norcalli/nvim-colorizer.lua",
  config = function()
    require("colorizer").setup(
      { "*" }, -- Highlight all file types
      {
        RGB = true, -- Enable #RGB hex codes
        RRGGBB = true, -- Enable #RRGGBB hex codes
        names = false, -- Disable color names
        css = true, -- Enable CSS features (e.g., rgb(), rgba())
        css_fn = true, -- Enable CSS color functions
      }
    )
  end,
}
