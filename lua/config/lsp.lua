-- Deprecated code
-- local status, nvim_lsp = pcall(require, "lspconfig")
-- if not status then
--   return
-- end
local util = require 'lspconfig.util'

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
  -- format on save
  -- if client.server_capabilities.documentFormattingProvider then
  --   vim.api.nvim_create_autocmd("BufWritePre", {
  --     group = vim.api.nvim_create_augroup("Format", { clear = true }),
  --     buffer = bufnr,
  --     callback = function()
  --       vim.lsp.buf.format()
  --     end,
  --   })
  -- end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

--Enable (broadcasting) snippet capability for completion
capabilities.textDocument.completion.completionItem.snippetSupport = true

vim.lsp.enable('html')
vim.lsp.config('html', {
  on_attach = on_attach,
  capabilities = capabilities,
})

-- DenoJs
-- nvim_lsp.denols.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
-- }

-- TypeScript
vim.lsp.enable('ts_ls')
vim.lsp.config('ts_ls', {
  on_attach = on_attach,
  capabilities = capabilities,
  -- filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  -- root_dir = util.root_pattern("package.json"),
  -- single_file_support = false
})

-- Web Components
vim.lsp.enable('wc_ls')
vim.lsp.config('wc_ls', {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "/home/masterdarius/wc-language-server-linux-x64", "--lit", "--stdio" },
})

-- Astro
-- vim.lsp.enable('astro')
-- vim.lsp.config('astro', {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })

-- CSS
vim.lsp.enable('cssls')
vim.lsp.config('cssls', {
  on_attach = on_attach,
  capabilities = capabilities,
})

-- LUA
vim.lsp.enable('lua_ls')
vim.lsp.config('lua_ls', {
  -- on_attach = on_attach,
  -- capabilities = capabilities,
  -- filetypes = { "lua", "script" },
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  }
})

vim.lsp.enable('clangd')
vim.lsp.config('clangd', {
  on_attach = on_attach,
  capabilities = capabilities,
})

-- CCLS
-- vim.lsp.enable('ccls') vim.lsp.config('', {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	init_options = {
-- 		compilationDatabaseDirectory = "build",
-- 		index = {
-- 			threads = 0,
-- 		},
-- 		clang = {
-- 			excludeArgs = { "-frounding-math" },
-- 		},
-- 	},
-- })

-- ADA
-- vim.lsp.enable('als') vim.lsp.config('', {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })

-- ELIXIR
-- vim.lsp.enable('elixirls')
-- vim.lsp.config('elixirls', {
--   cmd = { "/home/masterdarius/projects/erlang_projects/elixir-ls/language_server.sh" },
--   capabilities = capabilities,
-- })

-- NIM
-- vim.lsp.enable('nim_langserver')
-- vim.lsp.config('nim_langserver', {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })

-- GO
-- vim.lsp.enable('gopls')
-- vim.lsp.config('gopls', {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })

-- ERLANG
-- vim.lsp.enable('erlangls')
-- vim.lsp.config('erlangls', {
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })

-- RUST
-- vim.lsp.enable('rust_analyzer') vim.lsp.config('', {
--   on_attach = on_attach,
--   settings = {
--     ["rust-analyzer"] = {
--       imports = {
--         granularity = {
--           group = "module",
--         },
--         prefix = "self",
--       },
--       cargo = {
--         buildScripts = {
--           enable = true,
--         },
--       },
--       procMacro = {
--         enable = true
--       },
--     }
--   }
-- })

vim.lsp.enable('cmake')
vim.lsp.config('cmake', {
  on_attach = on_attach,
  capabilities = capabilities
})

-- vim.lsp.enable('c3_lsp')
-- vim.lsp.config('c3_lsp', {
--   on_attach = on_attach,
--   capabilities = capabilities
-- })

-- vim.lsp.enable('zls')
-- vim.lsp.config('zls', {
--   on_attach = on_attach,
--   capabilities = capabilities
-- })

vim.lsp.enable('fennel_ls')
vim.lsp.config('fennel_ls', {
  on_attach = on_attach,
  capabilities = capabilities
})

-- TRIGGERS ERRORS
-- vim.lsp.enable('ocamllsp')
-- vim.lsp.config('ocamllsp',{
--   on_attach = on_attach,
--   capabilities = capabilities
-- })

-- CRYSTAL: experimental
-- NEEDS compilation in ~/projects/scry (but it fails!!!)
-- vim.lsp.enable('scry.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = { "/home/masterdarius/projects/scry/bin/scry" },
--   root_dir = vim.lsp.enable('util.root_pattern("shard.yml"),
-- }

-- HAXE
-- TODO: uses deprecated, update when neovim devs add support
-- require'lspconfig'.haxe_language_server.setup{
--   cmd = {"node", "/home/masterdarius/projects/haxe_projects/haxe-language-server/bin/haxe-language-server.js"},
--   on_attach = on_attach,
--   capabilities = capabilities,
-- }
-- vim.lsp.enable('haxe_language_server')
-- vim.lsp.config('haxe_language_server', {
--   root_dir = util.root_pattern("*.hxml", "project.xml", "Makefile", ".git"),
--   filetypes = {".hx", ".hxml"},
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })
