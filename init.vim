:set number
" :set relativenumber
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set smarttab
:set softtabstop=2
:set expandtab
:set mouse=a
:set scrolloff=8
:set colorcolumn=100
:set splitright
:set splitbelow
:set signcolumn=yes
:set nowrap
:set cursorline

call plug#begin()

Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
" Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'tomasiser/vim-code-dark'
Plug 'sjl/badwolf'
Plug 'EdenEast/nightfox.nvim'
Plug 'haishanh/night-owl.vim'


Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Plug 'dense-analysis/ale'

Plug 'editorconfig/editorconfig-vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'ray-x/cmp-treesitter'

Plug 'onsails/lspkind.nvim'

Plug 'dcampos/nvim-snippy'
Plug 'dcampos/cmp-snippy'

Plug 'liuchengxu/vim-clap'

Plug 'evanleck/vim-svelte', {'branch': 'main'}

" Plug 'airblade/vim-gitgutter'
" Plug 'jreybert/vimagit'
Plug 'tpope/vim-fugitive'

" http://neovimcraft.com/plugin/nvim-telescope/telescope.nvim/index.html
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }

" Plug 'preservim/nerdcommenter'

Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'

" Clojure
Plug 'Olical/conjure'
Plug 'PaterJason/cmp-conjure'
" Plug 'guns/vim-sexp' 


" Plug 'p00f/nvim-ts-rainbow'

" Tmux navigation
Plug 'christoomey/vim-tmux-navigator'

Plug 'Equilibris/nx.nvim'

set encoding=UTF-8

call plug#end()

set updatetime=300

autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focusable = false})

" Git configuration
" let g:gitgutter_sign_added = '+'
" let g:gitgutter_sign_modified = '>'
" let g:gitgutter_sign_removed = '-'
" let g:gitgutter_sign_removed_first_line = '^'
" let g:gitgutter_sign_modified_removed = '<'

let g:conjure#mapping#prefix = ",c"

let g:neo_tree_remove_legacy_commands = 1

filetype plugin on

" Leader Mappings
let mapleader = ","

noremap <Leader>q :q<cr>
nnoremap <Leader>n :tabnew<cr>
nnoremap <Leader>s :w<cr>
inoremap <Leader>s <C-c>:w<cr>
nnoremap <Leader>h :split<cr>
inoremap <Leader>h <C-c>:split<cr>
nnoremap <Leader>v :vsplit<cr>
inoremap <Leader>v <C-c>:vsplit<cr>

nnoremap <Leader>b :Buffers<cr>

noremap <Leader>f :!node node_modules/prettier/bin-prettier.js -w %<cr><cr>:e<cr>
" noremap <Leader>f :lua vim.lsp.buf.format()<cr>:w<cr>

nnoremap <C-p> :Telescope find_files<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <a-j> <C-w>w<C-e><C-w>w
nnoremap <a-k> <C-w>w<C-y><C-w>w

noremap <Leader>n :Neotree reveal_file=% right<cr>

" Go to Definition
nmap gd :lua vim.lsp.buf.definition()<cr>
nmap gR :lua vim.lsp.buf.references()<cr>
nmap K :lua vim.lsp.buf.hover()<cr>

nmap gn :lua vim.diagnostic.goto_next()<cr>
nmap gp :lua vim.diagnostic.goto_prev()<cr>

tnoremap <Esc> <C-\><C-n>

" Open terminal
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" :set completeopt=menu,menuone,noselect

" :colorscheme nordfox
:colorscheme codedark

" --- Just Some Notes ---
" :PlugClean :PlugInstall :UpdateRemotePlugins

" set completeopt=menu,menuone,noselect

lua <<EOF

  local cmp = require'cmp'
  local lspkind = require('lspkind')

  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    rainbow = {
      enable = true,
      disable = { "scss", "html", "js", "ts" },
      -- extended_mode = true
    },
    refactor = {
      smart_rename = { enable = true },
    }
  }

  cmp.setup({
    view = {
      entries = "custom"
    },
    snippet = {
      expand = function(args)
        require('snippy').expand_snippet(args.body)
     end,
    },
    window = {
      completion = {
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        col_offset = -3,
        side_padding = 0
      }
    },
    formatting = {
      format = lspkind.cmp_format({
--         mode = "symbol_text",
--         menu = ({
--           buffer = "[Buffer]",
--           nvim_lsp = "[LSP]",
--           conjure = "[CLJ]"
--         })
      })
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'snippy' },
      { name = 'treesitter' },
      { name = 'conjure' }
    }, {
     { name = 'buffer' },
    }
    )
    
  })

  -- Hide Inline Error Messages
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
      virtual_text = false
    }
  )

  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

  require'lspconfig'.clojure_lsp.setup{
    capabilities = capabilities
  }

  require'lspconfig'.tsserver.setup{
    capabilities = capabilities
  }

  local project_library_path = "/home/nma/.nvm/versions/node/v18.14.0/lib/node_modules"
  local cmd = {"ngserver", "--stdio", "--tsProbeLocations", project_library_path, "--ngProbeLocations", project_library_path}

  require'lspconfig'.angularls.setup{
    capabilities = capabilities,
    cmd = cmd,
    -- filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
    on_new_config = function(new_config, new_root_dir)
      new_config.cmd = cmd
    end
  }

  require'lspconfig'.html.setup {
    capabilities = capabilities,
  }

  require'lspconfig'.cssmodules_ls.setup{
    capabilities = capabilities
  }

  require'lspconfig'.cssls.setup {
    capabilities = capabilities,
  }

  require'lspconfig'.vimls.setup {
    capabilities = capabilities,
  }

  require'lspconfig'.bashls.setup {
    capabilities = capabilities,
  }

  require("nx").setup {
    -- Base command to run all other nx commands, some other values may be:
    -- - `npm nx`
    -- - `yarn nx`
    -- - `pnpm nx`
    nx_cmd_root = 'nx',

    -- Command running capabilities,
    -- see nx.m.command-runners for more details
    -- command_runner = require('nx.command-runners').terminal_command_runner(),
    -- Form rendering capabilities,
    -- see nx.m.form-renderers for more detials
    -- form_renderer = require('nx.form-renderers').telescope_form_renderer(),

    -- Whether or not to load nx configuration,
    -- see nx.loading-and-reloading for more details
    read_init = true,
  }

  require('telescope').load_extension('fzf')


-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function()
    return '▊'
  end,
  color = { fg = colors.blue }, -- Sets highlighting of component
  padding = { left = 0, right = 1 }, -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    return ''
  end,
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    return { fg = mode_color[vim.fn.mode()] }
  end,
  padding = { right = 1 },
}

ins_left {
  -- filesize component
  'filesize',
  cond = conditions.buffer_not_empty,
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  color = { fg = colors.magenta, gui = 'bold' },
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

ins_left {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { fg = '#ffffff', gui = 'bold' },
}

-- Add components to right sections
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  fmt = string.upper, -- I'm not sure why it's upper case either ;)
  cond = conditions.hide_in_width,
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'fileformat',
  fmt = string.upper,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = { fg = colors.green, gui = 'bold' },
}

ins_right {
  'branch',
  icon = '',
  color = { fg = colors.violet, gui = 'bold' },
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '柳 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

ins_right {
  function()
    return '▊'
  end,
  color = { fg = colors.blue },
  padding = { left = 1 },
}

-- Now don't forget to initialize lualine
lualine.setup(config)

EOF
