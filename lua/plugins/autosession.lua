return {
    "rmagatti/auto-session",
    config = function()
        local auto_session = require("auto-session")

        auto_session.setup({
            auto_restore_enabled = false,
            auto_session_suppress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/" },
            auto_save_enabled = false,
            auto_session_enable_last_session = false,
        })

        local keymap = vim.keymap
        vim.keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "Guardar sesión" })
        vim.keymap.set("n", "<leader>sr", "<cmd>SessionRestore<CR>", { desc = "Restaurar sesión" })
        vim.keymap.set("n", "<leader>sd", "<cmd>SessionDelete<CR>", { desc = "Eliminar sesión" })
    end,
}
