return {
  {"rebelot/kanagawa.nvim"},

  {"morhetz/gruvbox"},

  {"navarasu/onedark.nvim"},

  {"NLKNguyen/papercolor-theme"},

  {'projekt0n/github-nvim-theme',
    config = function()
      require('github-theme').setup({})
      vim.cmd('colorscheme github_dark_default')
    end
  }
}
