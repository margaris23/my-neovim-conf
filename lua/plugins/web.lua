return {
  {
    "wc-toolkit/wc-language-server",
    as = "wc-laguage-server",
    opts = {
      dir = "/home/masterdarius",
      ft = { "html", "javascriptreact", "typescriptreact", "astro", "svelte", "vue", "markdown", "mdx" },
      tsdk = vim.fn.getcwd() .. "/node_modules/typescript/lib",
      as = "wc-laguage-server",
    },
    config = function()
      print("WEB COMPONENTS")
      -- require("wc_language_server").setup()
    end,
  }
}
