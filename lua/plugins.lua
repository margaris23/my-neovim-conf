-- Automatically run: PackerCompile
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")

	-- Common utilities
	use("nvim-lua/plenary.nvim")

	-- Icons
	use("nvim-tree/nvim-web-devicons")

	-- Colorschema
	use("rebelot/kanagawa.nvim")

  -- Gruvbox theme
  use("morhetz/gruvbox")

  -- Catpuccin Theme
  use { "catppuccin/nvim", as = "catppuccin" }

  use("navarasu/onedark.nvim")

	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			require("configs.lualine")
		end,
		requires = { "nvim-web-devicons" },
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("configs.treesitter")
		end,
	})

	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lsp")
		end,
	})

	use("onsails/lspkind-nvim")
	use({
		"L3MON4D3/LuaSnip",
		tag = "v2.*",
	})

	-- cmp: Autocomplete
	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("configs.cmp")
		end,
	})
  -- use({ "saadparwaiz1/cmp_luasnip" })

	use("hrsh7th/cmp-nvim-lsp")
	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
  use({"hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp"})

	-- LSP diagnostics, code actions, and more via Lua.
	use({
		"nvimtools/none-ls.nvim",
		config = function()
			require("configs.none-ls")
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- Mason: Portable package manager
	use({
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	})

	use({
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("configs.mason-lsp")
		end,
    after = "mason.nvim"
	})

	-- File manager
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	})

	use({ "endel/vim-github-colorscheme" })

	-- Show colors
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" })
		end,
	})

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("configs.toggleterm")
		end,
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsigns")
		end,
	})

	-- Markdown Preview
	--	use({
	--"iamcco/markdown-preview.nvim",
	--		run = function()
	--			vim.fn["mkdp#util#install"]()
	--		end,
	--	})

	use("christoomey/vim-tmux-navigator")

	-- Auto pairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("configs.autopairs")
		end,
	})

	-- Comments
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})

	-- PHOENIX
	use({ "avdgaag/vim-phoenix" })

	-- CLang
	use("Shougo/deoplete.nvim")
	use("lighttiger2505/deoplete-vim-lsp")
	use("rhysd/vim-clang-format")

  -- C3
  use("pherrymason/c3-lsp")

  -- RUST (problematic)
  -- use("mrcjkb/rustaceanvim")

  -- EMMET
  use("mattn/emmet-vim")

  -- CRYSTAL
  use("vim-crystal/vim-crystal")
  use("crystal-lang-tools/scry")

	-- THEME
  -- use("nightsense/vimspectr")
  -- use("Mofiqul/vscode.nvim")
	-- use("catppuccin/nvim")

	-- Common Lisp
	-- use("vlime/vlime")

	-- use({ "deoplete-plugins/deoplete-clang" })

	-- Background Transparent
	--	use({
	--		"xiyaowong/nvim-transparent",
	--		config = function()
	--			require("transparent").setup({
	--				extra_groups = {
	--					"BufferLineTabClose",
	--					"BufferlineBufferSelected",
	--					"BufferLineFill",
	--					"BufferLineBackground",
	--					"BufferLineSeparator",
	--					"BufferLineIndicatorSelected",
	--				},
	--				exclude_groups = {},
	--			})
	--		end,
	--	})
end)
