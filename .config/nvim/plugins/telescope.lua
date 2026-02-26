return {
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({
            hidden = true,
            no_ignore = false, -- or true if you want to include gitignored files
          })
        end,
        desc = "Find Files (hidden included)",
      },
    },
  },
}
