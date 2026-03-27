-- Previsualización de colores CSS/Tailwind inline en el editor
return {
  "brenoprata10/nvim-highlight-colors",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    render = "background",   -- muestra el color como fondo del texto hex/rgb
    enable_tailwind = true,  -- reconoce clases de Tailwind (text-red-500, etc.)
  },
}
