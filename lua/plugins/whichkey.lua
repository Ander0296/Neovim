return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 500
  end,
  opts_extend = { "spec" },
  opts = {
    preset = "helix",
    defaults = {},
    spec = {
      {
        mode = { "n", "x" },

        { "<leader><tab>", group = "pestañas" },
        { "<leader>c", group = "código" },
        { "<leader>d", group = "depuración" },
        { "<leader>dp", group = "perfilador" },
        { "<leader>f", group = "archivos / buscar" },
        { "<leader>g", group = "git" },
        { "<leader>h", group = "Harpoon" },
        { "<leader>gh", group = "cambios (hunks)" },
        { "<leader>l", group = "LSP" },
        { "<leader>q", group = "salir / sesión" },
        { "<leader>s", group = "buscar" },
        { "<leader>r", group = "reemplazar" },
        { "<leader>u", group = "interfaz (UI)" },
        { "<leader>x", group = "diagnósticos / quickfix" },

        { "[", group = "anterior" },
        { "]", group = "siguiente" },
        { "g", group = "ir a" },
        { "gs", group = "rodear (surround)" },
        { "z", group = "plegado (fold)" },

        {
          "<leader>b",
          group = "buffers",
          expand = function()
            return require("which-key.extras").expand.buf()
          end,
        },
        {
          "<leader>w",
          group = "ventanas",
          proxy = "<c-w>",
          expand = function()
            return require("which-key.extras").expand.win()
          end,
        },

        -- mejores descripciones
        { "gx", desc = "Abrir con la app del sistema" },
      },
    },
    icons = {
      group = " ",
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Atajos del buffer (which-key)",
    },
    {
      "<c-w><space>",
      function()
        require("which-key").show({ keys = "<c-w>", loop = true })
      end,
      desc = "Modo Hydra de ventanas (which-key)",
    },
  },

  config = function(_, opts)
    require("which-key").setup(opts)
  end,
}
