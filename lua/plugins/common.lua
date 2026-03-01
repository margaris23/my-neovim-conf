-- Common utilities
return {
	{"nvim-lua/plenary.nvim"},

	{"nvim-tree/nvim-web-devicons"},

  -- TODO: change to opts
  {
    "nvim-lualine/lualine.nvim",
    event = "BufEnter",
    config = function()
      require("config.lualine")
    end,
    requires = { "nvim-web-devicons" },
  },

  {
    "nvim-neo-tree/neo-tree.nvim", opts = { branch = "v3.x", },
    dependencies = {
     "antosha417/nvim-lsp-file-operations",
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    }
  },

  {"christoomey/vim-tmux-navigator"},

}

