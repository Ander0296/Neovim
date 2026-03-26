return {
  "barrett-ruth/live-server.nvim",
  cmd = { "LiveServerStart", "LiveServerStop", "LiveServerToggle" },
  keys = {
    { "<leader>cs", "<cmd>LiveServerToggle<cr>", desc = "Live Server (toggle)" },
  },
  config = false,
}
