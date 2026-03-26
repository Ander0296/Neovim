return {
  "MagicDuck/grug-far.nvim",
  cmd = "GrugFar",
  keys = {
    { "<leader>sr", function() require("grug-far").open() end, desc = "Buscar y reemplazar" },
    {
      "<leader>sw",
      function()
        require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
      end,
      desc = "Buscar y reemplazar (palabra)",
    },
    {
      "<leader>sr",
      function()
        require("grug-far").with_visual_selection()
      end,
      mode = "v",
      desc = "Buscar y reemplazar (selección)",
    },
  },
  opts = {},
}
