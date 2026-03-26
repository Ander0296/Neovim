return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<leader>gs", function() require("neogit").open() end, desc = "Git status (Neogit)" },
      { "<leader>gc", function() require("neogit").open({ "commit" }) end, desc = "Git commit" },
      { "<leader>gl", function() require("neogit").open({ "log" }) end, desc = "Git log" },
      { "<leader>gP", function() require("neogit").open({ "push" }) end, desc = "Git push" },
    },
    opts = {
      integrations = {
        telescope = true,
        diffview = true,
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    cmd = { "DiffviewOpen", "DiffviewFileHistory" },
    keys = {
      { "<leader>gD", "<cmd>DiffviewOpen<cr>", desc = "Diffview (todos los cambios)" },
      { "<leader>gH", "<cmd>DiffviewFileHistory %<cr>", desc = "Historial del archivo" },
    },
    opts = {},
  },
}
