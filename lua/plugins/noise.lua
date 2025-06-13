-- Plugin: noice.nvim
-- Funcionalidad: Mejora la interfaz de usuario de Neovim para mostrar comandos, mensajes, búsqueda y notificaciones.
-- Reemplaza las ventanas flotantes básicas de LSP y las líneas de comandos por interfaces modernas y más legibles.

return {
	"folke/noice.nvim",
	event = "VeryLazy", -- Se carga de forma diferida (cuando es necesario)
	dependencies = {
		"MunifTanjim/nui.nvim", -- Proporciona componentes de UI flotante
		"rcarriga/nvim-notify", -- Notificaciones visuales mejoradas
	},
	config = function()
		require("noice").setup({

			-- Mejora visual para la línea de comandos
			cmdline = {
				view = "cmdline_popup", -- Muestra la línea de comandos en un popup flotante
				format = {
					cmdline = { icon = "", title = " Comando " },
					search_down = { icon = "🔍 ", title = " Buscar ↓" },
					search_up = { icon = "🔍 ", title = " Buscar ↑" },
				},
			},

			-- Búsquedas (/, ?)
			messages = {
				view_search = "virtualtext", -- Muestra la búsqueda como texto virtual
			},

			-- Autocompletado flotante
			popupmenu = {
				enabled = true,
				backend = "nui", -- Usa NUI para mostrar el menú de autocompletado
			},

			-- Integración con LSP (servidores de lenguaje)
			lsp = {
				progress = { enabled = true }, -- Muestra progreso de operaciones LSP
				signature = { enabled = true }, -- Muestra la firma de funciones al escribir
				hover = { enabled = true }, -- Muestra documentación flotante
				message = { enabled = true }, -- Captura y mejora los mensajes de LSP
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
				documentation = {
					border = { style = "rounded" }, -- Borde redondeado para los docs
				},
			},

			-- Estilos personalizados para ventanas flotantes
			views = {
				cmdline_popup = {
					position = { row = "20", col = "50%" },
					size = { width = 60, height = "auto" },
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					win_options = { winblend = 10 }, -- Transparencia
				},
				popupmenu = {
					relative = "editor",
					position = { row = 8, col = "50%" },
					size = { width = 60, height = 10 },
					border = {
						style = "rounded",
						padding = { 0, 1 },
					},
					win_options = {
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
						winblend = 10,
					},
				},
			},

			-- Presets útiles para mejorar la experiencia
			presets = {
				bottom_search = true, -- Muestra búsqueda (/) en la parte inferior
				command_palette = true, -- Mejora la experiencia del menú de comandos
				long_message_to_split = true, -- Si un mensaje es muy largo, lo manda a una ventana dividida
				inc_rename = false, -- Desactivado: útil solo si usas plugins de renombrado incremental
				lsp_doc_border = true, -- Bordes en la documentación del LSP
			},
		})

		--------------------------------------------------------------------
		-- Estilo visual para ventanas flotantes (colores personalizados)
		--------------------------------------------------------------------
		vim.api.nvim_set_hl(0, "NoiceCmdlinePopup", { link = "NormalFloat" })
		vim.api.nvim_set_hl(0, "NoiceCmdlinePopupBorder", { link = "FloatBorder" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })
		vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#7aa2f7", bg = "NONE" })
	end,
}
