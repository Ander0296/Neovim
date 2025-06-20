---@diagnostic disable: missing-fields
local cmp = require("cmp")
local luasnip = require("luasnip")
local cmp_autopairs = require "nvim-autopairs.completion.cmp"

local M = {}

function M.setup()
    cmp.setup({
        window = {
            completion = {
                border = "rounded",
            },
            documentation = {
                border = "rounded",
            },
        },
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },

        mapping = {
            ["<C-k>"] = cmp.mapping.select_prev_item(), -- Sugerencia anterior
            ["<C-j>"] = cmp.mapping.select_next_item(), -- Siguiente sugerencia
            ["<C-u>"] = cmp.mapping.scroll_docs(-4),    -- Subir en la documentación
            ["<C-d>"] = cmp.mapping.scroll_docs(4),     -- Bajar en la documentación
            ["<C-e>"] = cmp.mapping.abort(),            -- Cerrar el menú de autocompletado
            ["<C-n>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                elseif luasnip.choice_active() then
                    luasnip.change_choice(1)
                else
                    fallback()
                end
            end, { "i", "s" }),
            ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true, }), -- Confirmar la sugerencia seleccionada
            ["<C-Space>"] = cmp.mapping.complete(),                                                    -- Mostrar menú de sugerencias manualmente
        },

        sources = {
            { name = "nvim_lsp" },
            { name = "path" },
            { name = "luasnip" },
            { name = "buffer" },
        },
    })

    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { text = "" } })

    cmp.setup.filetype("gitcommit", {
        sources = cmp.config.sources({
            { name = "git" },
        }, {
            { name = "buffer" },
        })
    })

    cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
            { name = "buffer" }
        }
    })

    cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
            { name = "path" }
        }, {
            { name = "cmdline" }
        })
    })
end

return M
