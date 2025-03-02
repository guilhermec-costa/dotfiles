local dap = require "dap"
local dapui = require("dapui")

-- Setup do DAP UI
dapui.setup({
    controls = {
        element = "repl",
        enabled = true,
        icons = {
            disconnect = "",
            pause = "",
            play = "",
            run_last = "",
            step_back = "",
            step_into = "",
            step_out = "",
            step_over = "",
            terminate = ""
        }
    },
    element_mappings = {
        -- Mapear teclas para elementos específicos
    },
    expand_lines = true,
    floating = {
        border = "single",
        mappings = {
            close = { "q", "<Esc>" }
        }
    },
    force_buffers = true,
    icons = {
        collapsed = "",
        current_frame = "",
        expanded = ""
    },
    layouts = {
        {
            elements = {
                { id = "scopes", size = 0.2 },
                { id = "breakpoints", size = 0.2 },
                { id = "stacks", size = 0.2 },
                { id = "watches", size = 0.2 },
            },
            position = "left",
            size = 40
        },
        {
            elements = {
                { id = "repl", size = 0.5 },
                { id = "console", size = 0.5 },
            },
            position = "bottom",
            size = 15
        }
    },
    mappings = {
        edit = "e",          -- Editar variáveis
        expand = { "<CR>", "<2-LeftMouse>" },  -- Expandir visualização
        open = "o",          -- Abrir a interface
        remove = "d",        -- Remover item
        repl = "r",          -- Repl interativo
        toggle = "t"         -- Alternar visibilidade
    },
    render = {
        indent = 1,
        max_value_lines = 100
    }
})

-- Adicionar listeners para abrir/fechar o dap-ui automaticamente
local function open_dapui()
    dapui.open()
end

local function close_dapui()
    dapui.close()
end

dap.listeners.before.attach.dapui_config = open_dapui
dap.listeners.before.launch.dapui_config = open_dapui
dap.listeners.before.event_terminated.dapui_config = close_dapui
dap.listeners.before.event_exited.dapui_config = close_dapui

-- Mapeamento de teclas para alternar a interface do DAP
vim.keymap.set('n', '<leader>ui', require 'dapui'.toggle)
