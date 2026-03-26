return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    dashboard = {
      preset = {
        keys = {
          { icon = " ", key = "f", desc = "Buscar archivo", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "Nuevo archivo", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Buscar texto", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Archivos recientes", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "s", desc = "Restaurar sesión", action = ":SessionRestore" },
          { icon = " ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Salir", action = ":qa" },
        },
        header = [[
 █████╗ ███╗   ██╗██████╗ ███████╗██████╗
██╔══██╗████╗  ██║██╔══██╗██╔════╝██╔══██╗
███████║██╔██╗ ██║██║  ██║█████╗  ██████╔╝
██╔══██║██║╚██╗██║██║  ██║██╔══╝  ██╔══██╗
██║  ██║██║ ╚████║██████╔╝███████╗██║  ██║
╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚═╝  ╚═╝]],
      },
      sections = {
        { section = "header" },
        {
          pane = 2,
          section = "terminal",
          cmd = "/usr/local/bin/colorscript -e square",
          height = 5,
          padding = 1,
        },
        { section = "keys", gap = 1, padding = 1 },
        { pane = 2, icon = " ", title = "Archivos recientes", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Proyectos", section = "projects", indent = 2, padding = 1 },
        {
          pane = 2,
          icon = " ",
          title = "Git Status",
          section = "terminal",
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
          cmd = "git status --short --branch --renames",
          height = 5,
          padding = 1,
          ttl = 5 * 60,
          indent = 3,
        },
        { section = "startup" },
      },
    },
  },
}
