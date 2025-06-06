local dap = require("dap")
--[[ local js_based_languages = { "typescript", "javascript", "typescriptreact", "cpp" } ]]

--[[ require("dap-vscode-js").setup({ ]]
    --[[ node_path = "node",                                                                                                      -- Path of node executable. Defaults to $NODE_PATH, and then "node" ]]
    --[[ debugger_path = vim.fn.expand("~/.local/share/nvim/site/pack/packer/opt/vscode-js-debug"),                               -- Path to vscode-js-debug installation ]]
    -- debugger_cmd = { "extension" }, -- Command to use to launch the debug server. Takes precedence over `node_path` and `debugger_path`.
    --[[ adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' }, -- which adapters to register in nvim-dap ]]
    -- log_file_path = "(stdpath cache)/dap_vscode_js.log", -- Path for file logging
    -- log_file_level = false, -- Logging level for output to file. Set to false to disable file logging.
    -- log_console_level = vim.log.levels.ERROR -- Logging level for output to console. Set to false to disable console output.
--[[ }) ]]

--[[ dap.adapters.cpp = {
    type = 'executable',
    -- absolute path is important here, otherwise the argument in the `runInTerminal` request will default to $CWD/lldb-vscode
    command = '/home/guichina/.local/share/nvim/mason/packages/codelldb/codelldb',
    name = "lldb"
} ]]



---@param pkg string
---@param path? string
--[[ local function get_pkg_path(pkg, path) ]]
--[[   pcall(require, 'mason') ]]
--[[   local root = vim.env.MASON or (vim.fn.stdpath('data') .. '/mason') ]]
--[[   path = path or '' ]]
--[[   local ret = root .. '/packages/' .. pkg .. '/' .. path ]]
--[[   return ret ]]
--[[ end ]]

--[[ require('dap').adapters['pwa-node'] = { ]]
--[[   type = 'server', ]]
--[[   host = 'localhost', ]]
--[[   port = '${port}', ]]
--[[   executable = { ]]
--[[     command = 'node', ]]
--[[     args = { ]]
--[[       get_pkg_path('js-debug-adapter', '/js-debug/src/dapDebugServer.js'), ]]
--[[       '${port}', ]]
--[[     }, ]]
--[[   }, ]]
--[[ } ]]

--[[ for _, language in ipairs(js_based_languages) do ]]
--[[     dap.configurations[language] = { ]]
--[[         { ]]
--[[             type = "pwa-node", ]]
--[[             request = "launch", ]]
--[[             name = "Launch file", ]]
--[[             program = "${file}", ]]
--[[             cwd = "${workspaceFolder}", ]]
--[[         }, ]]
--[[         { ]]
--[[             type = "pwa-node", ]]
--[[             host = "localhost", ]]
--[[             request = "attach", ]]
--[[             name = "Attach", ]]
--[[             processId = require('dap.utils').pick_process, ]]
--[[             cwd = "${workspaceFolder}", ]]
--[[             protocol = "inspector", ]]
--[[         }, ]]
--[[         { ]]
--[[             type = "pwa-chrome", ]]
--[[             request = "launch", ]]
--[[             name = "Start Chrome with \"localhost\"", ]]
--[[             url = "http://localhost:3000", ]]
--[[             webRoot = "${workspaceFolder}", ]]
--[[             userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir" ]]
--[[         }, ]]
--[[     } ]]
--[[ end ]]

vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<leader>l', dap.toggle_breakpoint)
vim.keymap.set('n', '<leader>L', dap.set_breakpoint)


require("mason-nvim-dap").setup({
  ensure_installed = {
    "codelldb",           -- Para C/C++
    "js-debug-adapter",   -- Para Node.js, JavaScript e TypeScript
    "javadbg",            -- Para Java
    "node2"               -- Adaptador específico para Node.js e TypeScript
  },
  handlers = {
    function(config)
      require('mason-nvim-dap').default_setup(config)
    end,

  },
})
require("nvim-dap-virtual-text").setup()
