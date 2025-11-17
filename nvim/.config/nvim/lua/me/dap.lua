local dap = require("dap")
local js_based_languages = { "typescript", "javascript", "typescriptreact" }

require("dap-vscode-js").setup({
    node_path = "node",
    debugger_path = vim.fn.expand("~/.local/share/nvim/site/pack/packer/opt/vscode-js-debug"),
    debugger_cmd = { "extension" },
    adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' },
    log_file_path = vim.fn.stdpath("cache") .. "/dap_vscode_js.log",
    log_file_level = false,
    log_console_level = vim.log.levels.ERROR
})

-- Configuração para C++
dap.adapters.cpp = {
    type = 'executable',
    command = '/home/guichina/.local/share/nvim/mason/packages/codelldb/codelldb',
    name = "lldb"
}

-- Configurações para linguagens JavaScript/TypeScript
for _, language in ipairs(js_based_languages) do
    dap.configurations[language] = {
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
        },
        {
            type = "pwa-node",
            host = "localhost",
            request = "attach",
            name = "Attach",
            processId = require('dap.utils').pick_process,
            cwd = "${workspaceFolder}",
            --[[ port = 9229, ]]
            protocol = "inspector",
        },
        {
            type = "pwa-chrome",
            request = "launch",
            name = "Start Chrome with \"localhost\"",
            url = "http://localhost:3000",
            webRoot = "${workspaceFolder}",
            userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir"
        },
    }
end

-- Configuração para C/C++
dap.configurations.cpp = {
    {
        name = "Launch",
        type = "cpp",
        request = "launch",
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
    },
}

-- Keymaps
vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<leader>l', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>L', dap.set_breakpoint)

require("mason-nvim-dap").setup({
    ensure_installed = {
        "codelldb",
        "js-debug-adapter",
        "javadbg",
        "node2"
    },
    handlers = {
        function(config)
            require('mason-nvim-dap').default_setup(config)
        end,
    },
})

require("nvim-dap-virtual-text").setup()
