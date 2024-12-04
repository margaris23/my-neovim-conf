local status, masonlsp = pcall(require, "mason-lspconfig")

if not status then
	return
end

masonlsp.setup({
	automatic_installation = true,
	ensure_installed = {
		"lua_ls",
		"clangd",
		"html",
		"jsonls",
		"ts_ls",
		"pyright",
	},
})
