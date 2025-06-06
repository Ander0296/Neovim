-- ✅ Notificación al guardar cualquier archivo
vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function()
		local file = vim.fn.expand("%:t")
		vim.notify("Archivo guardado: " .. file, "info", { title = "Guardar 📁" })
	end,
})

-- 🚀 Notificación de bienvenida al abrir Neovim
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		vim.schedule(function()
			vim.notify("¡Bienvenido, Anderson! 🚀", "info", { title = "Neovim listo" })
		end)
	end,
})

-- ✍️ Notificación al entrar en modo INSERT
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		vim.notify("Entraste en modo INSERT", "info", { title = "Modo" })
	end,
})

-- Entrar en modo visual
vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = "*:[vV]", -- Detecta cambios hacia visual (visual, visual-line, visual-block)
	callback = function()
		vim.notify("Estás en modo VISUAL", "info", { title = "Modo Visual 🧲" })
	end,
})

-- Abrir un archivo
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local file = vim.fn.expand("%:t")
		vim.notify("Abriendo: " .. file, "info", { title = "Archivo 📄" })
	end,
})

-- 🧪 Notificación para archivos específicos como main.java
vim.api.nvim_create_autocmd("BufRead", {
	pattern = "main.java",
	callback = function()
		vim.notify("¡Archivo principal Java detectado!", "info", { title = "Java" })
	end,
})

-- Atajo para mostrar el estado de Git con notificación
vim.keymap.set("n", "<leader>gs", function()
	vim.fn.jobstart({ "git", "status", "--short" }, {
		stdout_buffered = true,
		on_stdout = function(_, data)
			if data then
				local msg = table.concat(data, "\n")
				vim.notify(msg, "info", { title = "Git Status" })
			end
		end,
	})
end, { desc = "Mostrar estado de Git con notificación" })
