local base = {
  red = "#ff657a",
  maroon = "#F29BA7",
  peach = "#ff9b5e",
  yellow = "#eccc81",
  green = "#a8be81",
  teal = "#9cd1bb",
  sky = "#A6C9E5",
  sapphire = "#86AACC",
  blue = "#5d81ab",
  lavender = "#66729C",
  mauve = "#b18eab",
}

local extend_base = function(value)
  return vim.tbl_extend("force", base, value)
end

require('onedark').setup({
  transparent = false,
  colors = {
    black = "#101012",
		bg0 = "#fafafa",
		bg1 = "#f0f0f0",
		bg2 = "#e6e6e6",
		bg3 = "#dcdcdc",
		bg_d = "#c9c9c9",
		bg_blue = "#68aee8",
		bg_yellow = "#50a14f",
		fg = "#000000",
		purple = "#0000ff",
		green = "#c32b15",
		orange = "#0000ff",
		blue = "#000000",
		yellow = "#101012",
		cyan = "#0000ff",
		red = "#101012",
		grey = "#188018",
		light_grey = "#0000ff",
		dark_cyan = "#2b5d63",
		dark_red = "#833b3b",
		dark_yellow = "#7c5c20",
		dark_purple = "#79428a",
		diff_add = "#e2fbe4",
		diff_delete = "#fce2e5",
		diff_change = "#e2ecfb",
		diff_text = "#cad3e0",
  }
})

require("catppuccin").setup({
    flavour = "auto", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {"italic"},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {
      -- latte = {
      --   base = "#ffffff",
      --   blue = "#000000",
      --   mauve = "#0000ff",
      --   peach= "#118c93",
      --   overlay2 = "#008000",
      --   yellow = "#0000ff",
      --   green = "#c32b15",
      --   sky = "#000000",
      --   pink = "#0000ff",
      --   lavender ="#000000",
      --   text = "#000000"
      -- }
    },
    custom_highlights = {},
    default_integrations = true,
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        notify = false,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})
