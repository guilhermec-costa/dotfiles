local lsp_status_ok, lsp_zero = pcall(require, 'lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
end)

require('lspconfig').lua_ls.setup {
    settings = {
        Lua = {
            workspace = {
                checkThirdParty = false,
                telemetry = { enable = false },
                library = {
                    "${3rd}/love2d/library"
                }
            },
            diagnostics = {
                globals = { 'vim', 'P' }
            }
        }
    }
}

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {},
    handlers = {
        lsp_zero.default_setup,
    },
})

require("lspconfig").clangd.setup {
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" }
}

vim.keymap.set({ 'n', 'i' }, '<A-k>', function()
    require('lsp_signature').toggle_float_win()
end, { silent = true, noremap = true, desc = 'toggle signature' })
