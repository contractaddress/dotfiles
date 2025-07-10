return {
  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- Make sure it loads early
    config = function()
      require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = true,
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        contrast = "soft", -- can be "hard", "soft" or empty string
        palette_overrides = {},
        overrides = {},
        dim_inactive = false,
        transparent_mode = true,
      })

      local bg_transparent = true

      local toggle_transparent = function()
        bg_transparent = not bg_transparent
        -- Update the plugin's configuration
        require("gruvbox").setup({
          transparent_mode = bg_transparent,
        })
        -- Force colorscheme reload
        vim.cmd([[colorscheme gruvbox]])
        -- Add visual feedback
        vim.notify("Transparency: " .. (bg_transparent and "ON" or "OFF"), vim.log.levels.INFO)
      end

      -- Register the keymap
      vim.keymap.set("n", "<F5>", toggle_transparent, { noremap = true, silent = false, desc = "Toggle transparency" })

      -- Uncomment the line below if you want to set Gruvbox as your default colorscheme
      vim.cmd.colorscheme("gruvbox")
    end,
  },

  -- Uncomment the section below if you want to make Gruvbox your default colorscheme
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "gruvbox",
  --   },
  -- },
}
