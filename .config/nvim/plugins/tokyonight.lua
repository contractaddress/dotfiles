return {
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- Make sure it loads early
    config = function()
      require("tokyonight").setup({
        -- Choose style: "storm", "moon", "night", "day"
        style = "moon",
        -- Enable transparent background
        transparent = true,
        -- Configure terminal colors
        terminal_colors = true,
        -- Styling options
        styles = {
          comments = { italic = true },
          keywords = { italic = true },
          functions = {},
          variables = {},
          sidebars = "dark",
          floats = "dark",
        },
        -- Sidebar-like windows get darker background
        sidebars = { "qf", "help", "terminal", "telescope", "explorer", "packer", "NvimTree", "neo-tree" },
        -- Make popups and floating windows darker
        dim_inactive = false,
        -- Disable all the highlight groups that weren't explicitly set
        lualine_bold = false,
        -- Custom highlight group overrides
        on_colors = function(colors) end,
        on_highlights = function(highlights, colors) end,
      })

      -- Function to toggle transparency
      local function toggle_transparency()
        local current_config = require("tokyonight.config").options
        current_config.transparent = not current_config.transparent
        require("tokyonight").setup(current_config)
        vim.cmd.colorscheme("tokyonight")
      end

      -- Set F7 keymap to toggle transparency
      vim.keymap.set("n", "<F7>", toggle_transparency, { desc = "Toggle Tokyo Night transparency" })

      -- Uncomment the line below if you want to set Tokyo Night as your default colorscheme
      -- vim.cmd.colorscheme("tokyonight")
    end,
  },
}
