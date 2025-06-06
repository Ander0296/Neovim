local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Quitar resaltado de búsqueda" })
-- Gestión de ventanas
keymap.set("n", "<leader>+", "<C-w>v", { desc = "Dividir ventana verticalmente" })
keymap.set("n", "<leader>_", "<C-w>s", { desc = "Dividir ventana horizontalmente" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Igualar tamaño de divisiones" })
keymap.set("n", "<leader>w", "<cmd>close<CR>", { desc = "Cerrar división actual" })

-- Gestión de pestañas
keymap.set("n", "<C-t>", "<cmd>tabnew<CR>", { desc = "Abrir nueva pestaña" })
keymap.set("n", "<C-w>", "<cmd>tabclose<CR>", { desc = "Cerrar pestaña actual" })
keymap.set("n", "<A-l>", "<cmd>tabn<CR>", { desc = "Ir a la siguiente pestaña" })
keymap.set("n", "<A-h>", "<cmd>tabp<CR>", { desc = "Ir a la pestaña anterior" })
keymap.set("n", "<leader>nt", "<cmd>tabnew %<CR>", { desc = "Abrir buffer actual en nueva pestaña" })

-- Ajustar tamaño de splits con Ctrl + flechas
keymap.set("n", "<C-Right>", ":vertical resize -2<CR>", { desc = "Reducir ancho ventana" })
keymap.set("n", "<C-Left>", ":vertical resize +2<CR>", { desc = "Aumentar ancho ventana" })
keymap.set("n", "<C-Down>", ":resize -2<CR>", { desc = "Reducir alto ventana" })
keymap.set("n", "<C-Up>", ":resize +2<CR>", { desc = "Aumentar alto ventana" })

-- Navegación entre ventanas
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Mover a ventana izquierda" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Mover a ventana derecha" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Mover a ventana abajo" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Mover a ventana arriba" })

-- Siempre verás el resultado en el centro de tu pantalla.
vim.keymap.set('n', 'n', 'nzzzv', { desc = "Ir al siguiente resultado y centrar el cursor" })
vim.keymap.set('n', 'N', 'Nzzzv', { desc = "Ir al resultado anterior y centrar el cursor" })

-- Desactivar flechas (opcional)
vim.keymap.set({ "n", "i", "v" }, "<Up>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Down>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Left>", "<Nop>")
vim.keymap.set({ "n", "i", "v" }, "<Right>", "<Nop>")

-- Guardar con Ctrl+S
vim.keymap.set("n", "<C-s>", ":w<CR>", { desc = "Guardar archivo" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { desc = "Guardar archivo" })

-- Oil
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Abrir ventana de archivos OIL" })
