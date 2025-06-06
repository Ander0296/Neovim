-- Este archivo configura el esquema de colores de Neovim

return {

	-- Kanagawa
	{
		"rebelot/kanagawa.nvim",
		-- Configuración del plugin
		priority = 1000,
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
		priority = 999,
		config = function()
			vim.g.everforest_background = "soft"
			vim.g.everforest_transparent_background = 1
		end,
	},

	-- Gruvbox
	{
		"ellisonleao/gruvbox.nvim",
		priority = 998,
		opts = {
			terminal_colors = true,
			transparent_mode = true,
		},
	},
	-- Nord
	{
		"shaunsingh/nord.nvim",
		priority = 997,
	},

	-- Catppuccin (recomendado)
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 996,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				transparent_background = true,
			})
		end,
	},
}



