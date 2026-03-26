return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    scope = { enabled = true },
    exclude = {
      filetypes = { "help", "dashboard", "neo-tree", "Trouble", "lazy", "mason", "oil" },
    },
  },
}
