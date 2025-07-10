return {
  "uga-rosa/ccc.nvim",
  config = function()
    require("ccc").setup({
      -- Basic configuration options can be added here.
      -- For example, you may add options for customizing keybindings or colors.
    })
    -- Keymap for <leader>cc to execute CccPick command
    vim.api.nvim_set_keymap("n", "<leader>cc", "<cmd>CccPick<CR>", { noremap = true, silent = true })
  end,
}
