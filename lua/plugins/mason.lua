return {
	"williamboman/mason.nvim",
	cmd = "Mason",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

		mason.setup({
			ui = {
				border = "rounded",
				icons = {
					package_installed = "✔️", -- Instalado
					package_pending = "⏳", -- Instalando
					package_uninstalled = "", -- No instalado (puedes usar ,  o )
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				-- 🧠 LSPs recomendados para backend
				"lua_ls",
				"jdtls",
				"pyright",
				"bashls",
				"jsonls",
				"yamlls",
				"dockerls",
				"marksman",
				"graphql",
				"sqlls",
			},
			automatic_installation = true,
		})

		mason_tool_installer.setup({
			ensure_installed = {
				-- 🛠️ Herramientas útiles
				"stylua",
				"black",
				"isort",
				"pylint",
				"prettier",
				"eslint_d",
				"sql-formatter",
			},
			auto_update = true,
			run_on_start = true,
		})
	end,
}
