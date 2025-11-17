local dap = require "dap"
local dapui = require("dapui")

-- Setup do DAP UI com layout melhorado
dapui.setup({
    controls = {
        element = "repl",
        enabled = true,
        icons = {
            disconnect = "⏹",
            pause = "⏸",
            play = "▶",
            run_last = "⟲",
            step_back = "⏮",
            step_into = "⏬",
            step_out = "⏫",
            step_over = "⏭",
            terminate = "⏹"
        }
    },
    expand_lines = true,
    floating = {
        border = "rounded", -- Bordas arredondadas (mais moderno)
        mappings = {
            close = { "q", "<Esc>" }
        }
    },
    force_buffers = true,
    icons = {
        collapsed = "",
        current_frame = "",
        expanded = ""
    },
    layouts = {
        {
            elements = {
                -- Ordem e tamanhos mais próximos do VSCode
                { id = "scopes", size = 0.40 },      -- Variáveis locais (maior)
                { id = "breakpoints", size = 0.15 }, -- Breakpoints
                { id = "stacks", size = 0.30 },      -- Call stack
                { id = "watches", size = 0.15 },     -- Watch expressions
            },
            position = "left",
            size = 50  -- Aumentado para melhor visualização
        },
        {
            elements = {
                { id = "repl", size = 0.45 },
                { id = "console", size = 0.55 },  -- Console maior (output do programa)
            },
            position = "bottom",
            size = 12  -- Menor, mais focado
        }
    },
    mappings = {
        edit = "e",
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        repl = "r",
        toggle = "t"
    },
    render = {
        indent = 1,
        max_value_lines = 100
    }
})

-- Listeners para abrir/fechar automaticamente
dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end

dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end

dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end

dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end

-- Keymaps melhorados
vim.keymap.set('n', '<leader>ui', dapui.toggle, { desc = "Toggle DAP UI" })
vim.keymap.set('n', '<leader>ue', function() dapui.eval() end, { desc = "Evaluate expression" })
vim.keymap.set('v', '<leader>ue', function() dapui.eval() end, { desc = "Evaluate selection" })

-- Highlights customizados para melhor visual (opcional)
vim.api.nvim_set_hl(0, "DapUIVariable", { fg = "#D4D4D4" })
vim.api.nvim_set_hl(0, "DapUIScope", { fg = "#569CD6" })
vim.api.nvim_set_hl(0, "DapUIType", { fg = "#4EC9B0" })
vim.api.nvim_set_hl(0, "DapUIValue", { fg = "#CE9178" })
vim.api.nvim_set_hl(0, "DapUIModifiedValue", { fg = "#D16969", bold = true })
vim.api.nvim_set_hl(0, "DapUIDecoration", { fg = "#569CD6" })
vim.api.nvim_set_hl(0, "DapUIThread", { fg = "#4EC9B0" })
vim.api.nvim_set_hl(0, "DapUIStoppedThread", { fg = "#4EC9B0" })
vim.api.nvim_set_hl(0, "DapUIFrameName", { fg = "#D4D4D4" })
vim.api.nvim_set_hl(0, "DapUISource", { fg = "#569CD6" })
vim.api.nvim_set_hl(0, "DapUILineNumber", { fg = "#858585" })
vim.api.nvim_set_hl(0, "DapUIFloatBorder", { fg = "#569CD6" })
vim.api.nvim_set_hl(0, "DapUIWatchesEmpty", { fg = "#D16969" })
vim.api.nvim_set_hl(0, "DapUIWatchesValue", { fg = "#4EC9B0" })
vim.api.nvim_set_hl(0, "DapUIWatchesError", { fg = "#D16969" })
vim.api.nvim_set_hl(0, "DapUIBreakpointsPath", { fg = "#4EC9B0" })
vim.api.nvim_set_hl(0, "DapUIBreakpointsInfo", { fg = "#4EC9B0" })
vim.api.nvim_set_hl(0, "DapUIBreakpointsCurrentLine", { fg = "#4EC9B0", bold = true })
vim.api.nvim_set_hl(0, "DapUIBreakpointsLine", { fg = "#569CD6" })
