return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 500
    end,
    opts = {
        window = {
            border = "rounded", -- Borde elegante
            position = "bottom",
            margin = { 1, 2, 1, 2 }, -- Margen equilibrado
            padding = { 1, 2, 1, 2 }, -- Espaciado interno
            winblend = 10, -- Transparencia leve
        },
        layout = {
            spacing = 6, -- Espacio entre columnas
            align = "center", -- Centrado
        },
        icons = {
            group = " ", -- Ícono moderno de grupo (requiere Nerd Font)
        },
        disable = {
            buftypes = {},
            filetypes = {},
        },
        win = {border = "single"},
    },
    config = function()
        local wk = require("which-key")
        wk.setup()
        -- Puedes registrar otros atajos globales aquí si deseas
    end,
}

