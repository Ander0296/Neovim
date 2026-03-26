local map = vim.keymap.set

-- VENTANAS
map("n", "<leader>-", "<C-W>s", { desc = "Dividir ventana abajo", remap = true })
map("n", "<leader>|", "<C-W>v", { desc = "Dividir ventana a la derecha", remap = true })
map("n", "<leader>wd", "<C-W>c", { desc = "Cerrar ventana", remap = true })
map("n", "<C-h>", "<C-w>h", { desc = "Ir a la ventana izquierda", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Ir a la ventana inferior", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Ir a la ventana superior", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Ir a la ventana derecha", remap = true })
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Aumentar altura de la ventana" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Disminuir altura de la ventana" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Disminuir ancho de la ventana" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Aumentar ancho de la ventana" })

-- TABS
map("n", "<leader><tab><tab>", "<cmd>tabnew<cr>", { desc = "Nueva pestaña" })
map("n", "<leader><tab>d", "<cmd>tabclose<cr>", { desc = "Cerrar pestaña" })
map("n", "<A-l>", "<cmd>tabn<CR>", { desc = "Ir a la siguiente pestaña" })
map("n", "<A-h>", "<cmd>tabp<CR>", { desc = "Ir a la pestaña anterior" })

-- BUFFERS
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Buffer anterior" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Siguiente buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Alternar al último buffer" })
map("n", "<leader>bd", "<cmd>:bd<cr>", { desc = "Cerrar buffer y ventana" })

-- DESACTIVAR FLECHAS
map({ "n", "i", "v" }, "<Up>", "<Nop>")
map({ "n", "i", "v" }, "<Down>", "<Nop>")
map({ "n", "i", "v" }, "<Left>", "<Nop>")
map({ "n", "i", "v" }, "<Right>", "<Nop>")

-- COMPORTAMIENTO DE BUSQUEDAS
map("n", "n", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Siguiente resultado de búsqueda" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Siguiente resultado de búsqueda" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Siguiente resultado de búsqueda" })
map("n", "N", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Resultado anterior de búsqueda" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Resultado anterior de búsqueda" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Resultado anterior de búsqueda" })
map("n", "<Esc>", "<cmd>nohl<cr>", { desc = "Limpiar búsqueda" })

-- MOVER LÍNEAS CON ALT
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Mover línea hacia arriba" })
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Mover línea hacia abajo" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Mover línea hacia abajo (modo insertar)" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Mover línea hacia arriba (modo insertar)" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Mover selección hacia abajo" })
map(
	"v",
	"<A-k>",
	":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv",
	{ desc = "Mover selección hacia arriba" }
)

-- PUNTOS DE CORTE PARA UNDO
map("i", ",", ",<c-g>u", { desc = "Punto de deshacer al escribir ," })
map("i", ".", ".<c-g>u", { desc = "Punto de deshacer al escribir ." })
map("i", ";", ";<c-g>u", { desc = "Punto de deshacer al escribir ;" })

-- GUARDAR ARCHIVO
map({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Guardar archivo" })

-- SALIR DE NVIM
map("n", "<leader>qq", function()
	if vim.fn.getbufinfo({ buflisted = 1, changed = 1 })[1] then
		vim.cmd("confirm qa")
	else
		vim.cmd("qa")
	end
end, { desc = "Salir de todo" })

-- KEYWORDPRG
map("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Ayuda del término (keywordprg)" })

-- MEJOR INDENTACIÓN
map("x", "<", "<gv", { desc = "Disminuir indentación y mantener selección" })
map("x", ">", ">gv", { desc = "Aumentar indentación y mantener selección" })

-- CREACIÓN DE COMENTARIOS
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Agregar comentario abajo" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Agregar comentario arriba" })

-- NUEVO ARCHIVO
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "Nuevo archivo" })

-- DIAGNOSTICOS
local diagnostic_goto = function(next, severity)
	return function()
		vim.diagnostic.jump({
			count = (next and 1 or -1) * vim.v.count1,
			severity = severity and vim.diagnostic.severity[severity] or nil,
			float = true,
		})
	end
end
map("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Diagnósticos de la línea" })
map("n", "]d", diagnostic_goto(true), { desc = "Siguiente diagnóstico" })
map("n", "[d", diagnostic_goto(false), { desc = "Diagnóstico anterior" })
map("n", "]e", diagnostic_goto(true, "ERROR"), { desc = "Siguiente error" })
map("n", "[e", diagnostic_goto(false, "ERROR"), { desc = "Error anterior" })
map("n", "]w", diagnostic_goto(true, "WARN"), { desc = "Siguiente advertencia" })
map("n", "[w", diagnostic_goto(false, "WARN"), { desc = "Advertencia anterior" })

-- GIT (Telescope)
map("n", "<leader>gR", function()
	require("telescope.builtin").git_branches()
end, { desc = "Ramas de Git" })
map("n", "<leader>gS", function()
	require("telescope.builtin").git_status()
end, { desc = "Git status" })
map("n", "<leader>gC", function()
	require("telescope.builtin").git_commits()
end, { desc = "Commits del repo" })
map("n", "<leader>gf", function()
	require("telescope.builtin").git_bcommits()
end, { desc = "Commits del archivo" })
map("n", "<leader>gT", function()
	require("telescope.builtin").git_stash()
end, { desc = "Git stash" })

-- SCROLL CENTRADO
map("n", "<C-d>", "<C-d>zz", { desc = "Scroll abajo centrado" })
map("n", "<C-u>", "<C-u>zz", { desc = "Scroll arriba centrado" })

-- PEGAR SIN PISAR EL REGISTRO
map("x", "p", [["_dP]], { desc = "Pegar sin pisar el registro" })

-- TRADUCCIONES PARA LA LETRA G EN WHICHKEY
vim.api.nvim_create_autocmd("User", {
	pattern = "VeryLazy",
	callback = function()
		local ok, wk = pcall(require, "which-key")
		if not ok then
			return
		end
		wk.add({
			{ "g", group = "+ir a" },
			{ "ge", desc = "Fin de palabra anterior" },
			{ "gf", desc = "Ir al archivo bajo el cursor" },
			{ "gg", desc = "Ir a la primera línea" },
			{ "gi", desc = "Ir al último punto de inserción" },
			{ "gn", desc = "Buscar hacia adelante y seleccionar" },
			{ "gN", desc = "Buscar hacia atrás y seleccionar" },
			{ "gO", desc = "Símbolos del documento (LSP)" },
			{ "gt", desc = "Ir a la siguiente pestaña" },
			{ "gT", desc = "Ir a la pestaña anterior" },
			{ "gu", desc = "Convertir a minúsculas" },
			{ "gU", desc = "Convertir a mayúsculas" },
			{ "gv", desc = "Última selección visual" },
			{ "gw", desc = "Formatear texto" },
			{ "gx", desc = "Abrir con la app del sistema" },
			{ "g%", desc = "Ciclo hacia atrás en resultados" },
			{ "g,", desc = "Ir a posición más nueva (lista de cambios)" },
			{ "g;", desc = "Ir a posición más vieja (lista de cambios)" },
			{ "g~", desc = "Alternar mayúsculas/minúsculas" },
			{ "gc", group = "+comentarios" },
			{ "g'", group = "+marcas" },
			{ "g`", group = "+marcas" },
		}, { mode = "n" })
	end,
})
