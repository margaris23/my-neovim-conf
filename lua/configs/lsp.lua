local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
  return
end

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

nvim_lsp.html.setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- DenoJs
nvim_lsp.denols.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
}

-- TypeScript
nvim_lsp.ts_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  single_file_support = false
})

-- Astro
nvim_lsp.astro.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- CSS
nvim_lsp.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- LUA
nvim_lsp.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "lua", "script" },
})

nvim_lsp.clangd.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- CCLS
-- nvim_lsp.ccls.setup({
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
-- nvim_lsp.als.setup({
--   on_attach = on_attach,
--   capabilities = capabilities,
-- })

-- ELIXIR
nvim_lsp.elixirls.setup({
  cmd = { "/home/masterdarius/projects/erlang_projects/elixir-ls/language_server.sh" },
  capabilities = capabilities,
})

-- NIM
nvim_lsp.nim_langserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- GO
nvim_lsp.gopls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- ERLANG
nvim_lsp.erlangls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

-- RUST
nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true
      },
    }
  }
})

nvim_lsp.c3_lsp.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.zls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

nvim_lsp.fennel_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

-- CRYSTAL: experimental
-- NEEDS compilation in ~/projects/scry (but it fails!!!)
-- nvim_lsp.scry.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   cmd = { "/home/masterdarius/projects/scry/bin/scry" },
--   root_dir = nvim_lsp.util.root_pattern("shard.yml"),
-- }
