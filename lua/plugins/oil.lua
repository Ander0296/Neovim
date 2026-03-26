-- Oil: explorador de archivos tipo buffer
return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Explorador de archivos" },
    { "<leader>ee", "<cmd>Oil<cr>", desc = "Explorador de archivos" },
  },
  opts = {
    view_options = {
      show_hidden = true,
    },
    keymaps = {
      ["q"] = "actions.close",
    },
  },
}
