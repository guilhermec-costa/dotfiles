local diagnostic_producer = vim.api.nvim_create_namespace("diagnosticProducer")
local signs = { Error = "x ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    severity_sort = true,
    float         = {
        source = "always",
    },
})

vim.api.nvim_set_keymap('n', '<leader>do', '<cmd>lua vim.diagnostic.open_float()<CR>zz',
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>zz',
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>zz',
    { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dd', '<cmd>Telescope diagnostics<CR>', { noremap = true, silent = true })
