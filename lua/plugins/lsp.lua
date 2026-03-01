return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    -- build = function()
    --   require("nvim-treesitter.install").update({ with_sync = true })
    -- end,
    config = function()
      require("config.treesitter")
    end,
  },

  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- previewers = {
    --   builtin = {
    --     extensions = {
    --       ["png"] = {"viu", "-b"}
    --     }
    --   }
    -- }
  },

  {"onsails/lspkind-nvim" },

  { "L3MON4D3/LuaSnip" }, --, tag = "v2.*", },

  -- cmp: Autocomplete
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("config.cmp")
    end,
  },
  -- use({ "saadparwaiz1/cmp_luasnip" })

  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-path", after = "nvim-cmp" },
  { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },

  -- LSP diagnostics, code actions, and more via Lua.
  {
    "nvimtools/none-ls.nvim",
    config = function()
      require("config.none-ls")
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("config.lsp")
    end,
  }
}
