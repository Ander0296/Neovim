return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ha", function() require("harpoon"):list():add() end, desc = "Agregar archivo a Harpoon" },
    { "<leader>hh", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "Menú de Harpoon" },
    { "<leader>h1", function() require("harpoon"):list():select(1) end, desc = "Harpoon archivo 1" },
    { "<leader>h2", function() require("harpoon"):list():select(2) end, desc = "Harpoon archivo 2" },
    { "<leader>h3", function() require("harpoon"):list():select(3) end, desc = "Harpoon archivo 3" },
    { "<leader>h4", function() require("harpoon"):list():select(4) end, desc = "Harpoon archivo 4" },
    { "<leader>hp", function() require("harpoon"):list():prev() end, desc = "Harpoon anterior" },
    { "<leader>hn", function() require("harpoon"):list():next() end, desc = "Harpoon siguiente" },
  },
  config = function()
    require("harpoon"):setup()
  end,
}
