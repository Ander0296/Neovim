return {
  "echasnovski/mini.surround",
  keys = {
    { "gsa", mode = { "n", "v" }, desc = "Agregar surround" },
    { "gsd", desc = "Borrar surround" },
    { "gsr", desc = "Reemplazar surround" },
    { "gsf", desc = "Buscar surround (derecha)" },
    { "gsF", desc = "Buscar surround (izquierda)" },
    { "gsh", desc = "Resaltar surround" },
    { "gsn", desc = "Cantidad de líneas para surround" },
  },
  opts = {
    mappings = {
      add = "gsa",
      delete = "gsd",
      replace = "gsr",
      find = "gsf",
      find_left = "gsF",
      highlight = "gsh",
      update_n_lines = "gsn",
    },
  },
}
