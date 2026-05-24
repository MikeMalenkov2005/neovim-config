require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "clangd", "quick_lint_js", "jdtls" }
})

local on_attach = function(_, _)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
end

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- local lspconfig = require("lspconfig")

--[[

lspconfig.lua_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.clangd.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

lspconfig.quick_lint_js.setup {
  on_attach = on_attach,
  capabilities = capabilities
}

]]

vim.api.nvim_create_autocmd('LspAttach', { callback = on_attach })

vim.diagnostic.config({ virtual_text = true, update_in_insert = true })

vim.lsp.enable('lua_ls')
vim.lsp.enable('clangd')
vim.lsp.enable('jdtls')
