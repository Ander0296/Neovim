return {
    "hrsh7th/nvim-cmp",

    dependencies = {
        "hrsh7th/cmp-buffer", -- Fuente: texto en el buffer actual
        "hrsh7th/cmp-path",   -- Fuente: rutas del sistema de archivos
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-git",
        "L3MON4D3/LuaSnip",             -- Motor de snippets (fragmentos de código)
        "saadparwaiz1/cmp_luasnip",
        "rafamadriz/friendly-snippets", -- Muchos snippets útiles ya preparados
        "onsails/lspkind.nvim",         -- Iconos estilo VSCode en el menú de autocompletado
        "windwp/nvim-autopairs",
    },

    event = "VeryLazy",
    main = "config.plugins.cmp",
    config = true,
}
