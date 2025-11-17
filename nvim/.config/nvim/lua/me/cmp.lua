local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    completion = {
      autocomplete = false
    },
    mapping = {
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm {
            select = true,
            behavior = cmp.ConfirmBehavior.Insert
        },
        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),

        ['<C-j>'] = cmp_action.luasnip_supertab(),
        ['<C-k>'] = cmp_action.luasnip_shift_supertab()
    },
    sources = {
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "vsnip" },
        { name = "path" },
        { name = "buffer" },
    },

    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end
    },
    formatting = {
        format = function(entry, vim_item)
            vim_item.menu = ({
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                nvim_lua = "[API]",
                path = "[path]",
                luasnip = "[snip]",
            })[entry.source.name]
            return vim_item
        end,
    },
})
