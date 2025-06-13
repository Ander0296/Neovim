return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason-lspconfig",
		"folke/lazydev.nvim",
	},
	config = function()
		local on_attach = function(_, bufnr)
			vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"
			local opts = { buffer = bufnr }
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
			vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Mostrar diagnostico de línea" })
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Ir al diagnostico anterior" }) -- Diagnóstico anterior
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Ir al diagnostico siguiente" }) -- Diagnóstico siguiente
			vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, { desc = "Mostrar lista de localizaciones" })
			vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Mostrar referencias LSP" }) -- Ver referencias
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Ir a declaración" }) -- Ir a declaración
			vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", { desc = "Mostrar definiciones" }) -- Ver definiciones
			vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", { desc = "Mostrar implementaciones" }) -- Ver implementaciones
			vim.keymap.set(
				"n",
				"gt",
				"<cmd>Telescope lsp_type_definitions<CR>",
				{ desc = "Mostrar definición de tipo" }
			) -- Ver definición de tipo
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Ver acciones de código" }) -- Acciones de código
			vim.keymap.set("n", "<leader>rN", vim.lsp.buf.rename, { desc = "Renombrar inteligente" }) -- Renombrar símbolo
			vim.keymap.set(
				"n",
				"<leader>D",
				"<cmd>Telescope diagnostics bufnr=0<CR>",
				{ desc = "Mostrar diagnósticos del archivo" }
			) -- Diagnóstico de buffer
			vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Reiniciar LSP" }) -- Reiniciar LSP
			-- vim.keymap.set("n", "<space>f", function ()
			--     vim.lsp.buf.format { async = true }
			-- end, opts)
		end

		require("mason").setup()
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "jdtls" }, -- puedes añadir más aquí
			automatic_installation = true,
		})
		require("lazydev").setup({})
		require("lspconfig").lua_ls.setup({
			on_attach = on_attach,
			settings = {
				Lua = {
					telemetry = { enable = false },
					workspace = { checkThirdParty = false },
				},
			},
		})
	end,
}
