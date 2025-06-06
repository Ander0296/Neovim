-- Este archivo configura el esquema de colores de Neovim

return {
		-- Plugin del esquema de colores Kanagawa
		{
		"rebelot/kanagawa.nvim",
		-- Configuración del plugin
		config = function()
			-- Configura Kanagawa con las siguientes opciones:
			require('kanagawa').setup({
				compile = true,     -- Compila los colores para mejorar el rendimiento
				transparent = true, -- Fondo transparente (útil si usas una terminal con fondo personalizado)
			})

			-- Aplica el esquema de colores "kanagawa-dragon"
			vim.cmd("colorscheme kanagawa-dragon")
		end,

		-- Al construir (instalar/actualizar) el plugin, se compilan los colores
		build = function()
			vim.cmd("KanagawaCompile")
		end,
	},
	-- Everforest
	{
		"sainnhe/everforest",
		priority = 998,
		config = function()
			vim.g.everforest_background = "soft"
			vim.g.everforest_transparent_background = 1
		end,
	},

}



