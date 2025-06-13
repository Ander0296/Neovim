vim.g.mapleader = " "
local opt = vim.opt

-- Configuración común a ambos entornos
opt.autoindent = true -- Indenta automáticamente
opt.backspace = "indent,eol,start" -- Backspace inteligente (permite borrar indentaciones, líneas vacías y al inicio)
opt.breakindent = true -- Mantiene la indentación visual en líneas largas que se ajustan (wrap)
opt.clipboard:append("unnamedplus") -- Portapapeles del sistema (copiar/pegar con Ctrl+C/V)
opt.cursorline = true -- Resalta la línea actual
opt.expandtab = true -- Convertir tabuladores en espacios
opt.ignorecase = true -- Ignorar mayúsculas en búsquedas
opt.mouse = "" -- Desactivar mouse
opt.number = true -- Mostrar número de línea absoluto
opt.relativenumber = true -- Mostrar número de línea relativo (ayuda a navegar)
opt.scrolloff = 10 -- Deja 10 líneas de margen arriba y abajo del cursor
opt.shiftwidth = 4 -- 4 espacios al indentar con << o >>
opt.showmode = false -- Oculta el modo (insert/normal) si ya se muestra en la statusline
opt.signcolumn = "yes" -- Siempre mostrar columna de signos (errores, git, etc.)
opt.smartcase = true -- Sensible a mayúsculas si se usan en la búsqueda
opt.smartindent = true -- Indentación inteligente según el contexto
opt.smarttab = true -- Tab responde de forma inteligente al contexto de indentación
opt.softtabstop = 4 -- Elimina cuatro espacios si es tab
opt.splitbelow = true -- Dividir ventanas abajo
opt.splitright = true -- Dividir ventanas a la derecha
opt.swapfile = false -- No usar archivos swap
opt.tabstop = 4 -- 4 espacios por tabulador
opt.timeoutlen = 1500 -- Tiempo de espera para combinaciones de teclas (ms)
opt.undofile = true -- Guarda historial de deshacer entre sesiones
opt.wrap = false -- No ajustar líneas largas
opt.list = true -- Muestra caracteres invisibles como espacios y tabs
opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Si estás en WSL, usa win32yank para compartir el portapapeles con Windows
if vim.fn.has("wsl") == 1 then
	vim.g.clipboard = {
		name = "win32yank-wsl",
		copy = {
			["+"] = "win32yank.exe -i --crlf",
			["*"] = "win32yank.exe -i --crlf",
		},
		paste = {
			["+"] = "win32yank.exe -o --lf",
			["*"] = "win32yank.exe -o --lf",
		},
		cache_enabled = 0,
	}
end

-- Solo mostrar cursorline en la ventana activa
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
	callback = function()
		vim.wo.cursorline = true
	end,
})

vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave" }, {
	callback = function()
		vim.wo.cursorline = false
	end,
})

vim.o.laststatus = 3 -- Activar statusline global

-- Mostrar número y número relativo solo en la ventana activa
vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter", "FocusGained" }, {
	callback = function()
		vim.wo.number = true
		vim.wo.relativenumber = true
	end,
})
vim.api.nvim_create_autocmd({ "WinLeave", "BufLeave", "FocusLost" }, {
	callback = function()
		vim.wo.number = false
		vim.wo.relativenumber = false
	end,
})
