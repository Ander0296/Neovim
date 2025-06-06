if vim.g.vscode then
  return {}
end

return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      mode = "tabs",                 -- También puedes usar "buffers"
      separator_style = "slant",    -- Estilo visual
    },
  },
}
