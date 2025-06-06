-- Plugin: LuaSnip
-- Funcionalidad: Sistema de snippets (fragmentos de código) rápido y extensible para Neovim.
-- Es compatible con múltiples lenguajes y se integra fácilmente con nvim-cmp para autocompletado de snippets.

return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  build = "make install_jsregexp", -- mejora compatibilidad con expresiones regulares en snippets
  dependencies = {
    "rafamadriz/friendly-snippets", -- colección enorme de snippets en formato VSCode
  },
  config = function()
    local luasnip = require("luasnip")

    -- Configuración básica de LuaSnip
    luasnip.config.set_config({
      history = true, -- permite retroceder dentro de un snippet expandido
      updateevents = "TextChanged,TextChangedI", -- actualiza en tiempo real
      enable_autosnippets = true, -- habilita expansión automática
    })

    -- Carga todos los snippets de 'friendly-snippets' (VSCode style)
    require("luasnip.loaders.from_vscode").lazy_load()
  end,
}
