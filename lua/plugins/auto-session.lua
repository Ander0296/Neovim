return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    { "<leader>qr", "<cmd>SessionRestore<cr>", desc = "Restaurar sesión" },
    { "<leader>qs", "<cmd>SessionSave<cr>", desc = "Guardar sesión" },
    { "<leader>qd", "<cmd>SessionDelete<cr>", desc = "Borrar sesión" },
    { "<leader>qf", "<cmd>SessionSearch<cr>", desc = "Buscar sesión" },
  },
  opts = {
    auto_restore = false,
    suppressed_dirs = { "~/", "~/Downloads", "/tmp" },
  },
}
