return {
  {
    "sainnhe/everforest",
    lazy = false,
    priority = 1000,
    config = function()
      -- Set up Everforest options using vim globals
      -- Background contrast: 'hard', 'medium', or 'soft'
      vim.g.everforest_background = "medium"

      -- Initial transparency setting (0=disable, 1=enable)
      vim.g.everforest_transparent_background = 0

      -- Style settings
      vim.g.everforest_enable_italic = 0
      vim.g.everforest_disable_italic_comment = 0

      -- UI settings
      vim.g.everforest_sign_column_background = "none"
      vim.g.everforest_diagnostic_text_highlight = true
      vim.g.everforest_diagnostic_line_highlight = false
      vim.g.everforest_better_performance = false

      -- Apply the colorscheme
      --vim.cmd.colorscheme("everforest")

      -- Create F6 mapping to toggle transparency
      vim.keymap.set("n", "<F6>", function()
        if vim.g.everforest_transparent_background == 0 then
          vim.g.everforest_transparent_background = 1
          vim.cmd.colorscheme("everforest") -- Reapply colorscheme to take effect
          print("Everforest: Transparency enabled")
        else
          vim.g.everforest_transparent_background = 0
          vim.cmd.colorscheme("everforest") -- Reapply colorscheme to take effect
          print("Everforest: Transparency disabled")
        end
      end, { noremap = true, silent = true, desc = "Toggle Everforest transparency" })
    end,
  },
}
