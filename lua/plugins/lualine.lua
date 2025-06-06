-- Plugin: lualine.nvim
-- Funcionalidad: Barra de estado moderna y personalizable para Neovim.
-- Muestra información útil como nombre del archivo, modo de edición, rama de Git, errores del LSP, etc.

-- No se carga si estás en VSCode
if vim.g.vscode then
	return {}
end

return {
	"nvim-lualine/lualine.nvim",

	-- Dependencias requeridas para iconos en la barra
	dependencies = { "nvim-tree/nvim-web-devicons" },

	-- Configuración del plugin
	opts = {
		options = {
			globalstatus = true, -- Usa una única barra de estado para toda la ventana (recomendado en Neovim 0.7+)
		},

		sections = {
			-- Sección central (C) de la barra activa
			lualine_c = {
				{
					"filename", -- Muestra el nombre del archivo actual
					file_status = true, -- Muestra indicador [+] si fue modificado
					path = 1, -- Muestra la ruta relativa del archivo
				},
			},
		},

		-- Configuración para ventanas inactivas (opcional pero útil)
		inactive_winbar = {
			lualine_c = { "filename" }, -- Muestra solo el nombre del archivo en ventanas inactivas
		},
	},
}
