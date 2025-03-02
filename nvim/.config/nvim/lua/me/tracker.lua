local tracker = require("tracker")
tracker.setup {
    timer_delay = 3000,
    allow_notifications = true,
    logs_permission = true,
    cleanup_session_files_on_session_end = false,
    cleanup_log_files_on_session_end = false,
    persistence_location = "/home/guichina/.config/tracker/"
}

require "telescope".load_extension("tracker")
vim.keymap.set("n", "<leader>pd", "<cmd>Telescope tracker days<CR>", { noremap = true })
vim.keymap.set("n", "<leader>ps", "<cmd>Telescope tracker sessions<CR>", { noremap = true })
vim.keymap.set("n", "<leader>pc", "<cmd>Telescope tracker commands<CR>", { noremap = true })
vim.keymap.set("n", "<leader>l", "<cmd>Telescope tracker logs<CR>", { noremap = true })
vim.keymap.set("n", "<leader>df", "<cmd>Telescope tracker dashboard_files<CR>", { noremap = true })
