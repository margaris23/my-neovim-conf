 return {
   {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("config.mason-lsp")
    end,
    after = "mason.nvim"
  }

 }
