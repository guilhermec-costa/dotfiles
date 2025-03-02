local keymap = vim.keymap.set
local options = { noremap = true, silent = true }

vim.g.mapleader = ' '

-- Normal mode
keymap('n', '<C-k>', '<C-w>k', options)
keymap('n', '<C-j>', '<C-w>j', options)
keymap('n', '<C-l>', '<C-w>l', options)
keymap('n', '<C-h>', '<C-w>h', options)
keymap('n', "<leader>q", ":q", options)
keymap('n', "<C-d>", "<C-d>zz", options)
keymap('n', "<C-u>", "<C-u>zz", options)

keymap('n', '<C-s>l', ':vsplit<CR>', options)
keymap('n', '<C-s>j', ':split<CR>', options)
keymap('n', '<leader>q', ':q<Enter>', options)
keymap('n', '<leader>pv', function() vim.cmd('Ex') end)
keymap('n', '<leader>cl', ':nohlsearch<CR>', options)
keymap('n', "<leader><leader>", ':so<CR>')

-- register named k
keymap('n', '<leader>kp', '"kp')

-- paste from system clipboard
keymap('n', '<leader>sp', '"+p')

-- copy to system clipboard
keymap({ 'n', 'v' }, '<leader>sy', '"+yy')

keymap("x", "<leader>p", [[ "_dP ]])
-- window resizing
keymap('n', '<C-Up>', ':resize -2<CR>', options)
keymap('n', '<C-Down>', ':resize +2<CR>', options)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', options)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', options)

-- indent mode
keymap('v', '<', '<gv', options)
keymap('v', '>', '>gv', options)

keymap('v', '<A-j>', ":m '>+1<CR>gv=gv", options)
keymap('v', '<A-k>', ":m '<-2<CR>gv=gv", options)


keymap('n', '<leader>w', function()
    --[[ vim.lsp.buf.format() ]]
    vim.cmd('w')
end)

keymap('n', '<leader>F', vim.lsp.buf.format, {
    noremap = true, silent = true
})

keymap('n', '<leader>t', "<Plug>PlenaryTestFile")


vim.keymap.set('n', "<leader>ca", '<Cmd>lua vim.lsp.buf.code_action()<CR>', options);
vim.keymap.set('n', "<leader>rc", "<Cmd>lua vim.lsp.buf.range_code_action()<CR>",
    { noremap = true, silent = true, desc = "Code actions" });

-- Java specific
vim.keymap.set("n", "<leader>di", "<Cmd>lua require'jdtls'.organize_imports()<CR>", options)
vim.keymap.set("n", "<leader>dt", "<Cmd>lua require'jdtls'.test_class()<CR>", options)
vim.keymap.set("n", "<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>", options)
vim.keymap.set("v", "<leader>de", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", options)
vim.keymap.set("n", "<leader>de", "<Cmd>lua require('jdtls').extract_variable()<CR>", options)
vim.keymap.set("v", "<leader>dm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", options)
vim.keymap.set("n", "<leader>rj", "<Esc><Cmd>JdtRestart<CR>", options)

vim.keymap.set('n', '<C-n>', '<Cmd>BufferPrevious<CR>', options)
vim.keymap.set('n', '<C-m>', '<Cmd>BufferNext<CR>', options)
vim.keymap.set('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', options)
vim.keymap.set('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', options)
vim.keymap.set('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', options)
vim.keymap.set('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', options)
vim.keymap.set('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', options)
vim.keymap.set('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', options)
vim.keymap.set('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', options)
vim.keymap.set('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', options)
vim.keymap.set('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', options)
vim.keymap.set('n', '<leader>0', '<Cmd>BufferLast<CR>', options)
vim.keymap.set('n', '<leader>Q', '<Cmd>BufferClose<CR>', options)
--[[ :BufferCloseAllButCurrent ]]
--[[ :BufferCloseAllButPinned ]]
--[[ :BufferCloseAllButCurrentOrPinned ]]
--[[ :BufferCloseBuffersLeft ]]
--[[ :BufferCloseBuffersRight ]]
vim.keymap.set('n', '<C-p>', '<Cmd>BufferPick<CR>', options)
vim.keymap.set('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', options)
vim.keymap.set('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', options)
vim.keymap.set('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', options)
vim.keymap.set('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', options)
vim.keymap.set('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', options)
