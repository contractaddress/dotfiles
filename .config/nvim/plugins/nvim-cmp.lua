return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local cmp = require("cmp")
      -- Remove snippet-related sources
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
      })

      -- Basic completion settings
      opts.completion = {
        completeopt = "menu,menuone,noinsert",
      }

      -- Disable experimental features
      opts.experimental = {
        ghost_text = false,
      }

      -- Remove snippet-related configuration
      opts.snippet = nil

      return opts
    end,
  },
}
