return {
  {
    "L3MON4D3/LuaSnip",
    lazy = false, -- ensure it loads immediately
    version = "v2.*",
    build = "make install_jsregexp",
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
      print("Loading Friendly Snippets...")
      local ls = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load({
        paths = { vim.fn.stdpath("data") .. "/lazy/friendly-snippets" },
      })

      -- Tab mappings
      vim.keymap.set({ "i", "s" }, "<Tab>", function()
        return ls.expand_or_jumpable() and "<Plug>luasnip-expand-or-jump" or "<Tab>"
      end, { expr = true, silent = true })
      vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
        return ls.jumpable(-1) and "<Plug>luasnip-jump-prev" or "<S-Tab>"
      end, { expr = true, silent = true })
    end,
  },
}
