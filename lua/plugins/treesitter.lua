return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local ts = require("nvim-treesitter")

    local ensure_installed = {
      "bash", "c", "cpp", "css", "dockerfile",
      "go", "gomod", "gosum", "html", "java",
      "javascript", "json", "lua", "luadoc",
      "markdown", "markdown_inline", "python", "query",
      "regex", "rust", "sql", "toml", "tsx",
      "typescript", "vim", "vimdoc", "xml", "yaml", "zig",
    }

    local installed = ts.get_installed()
    local to_install = vim.tbl_filter(function(lang)
      return not vim.tbl_contains(installed, lang)
    end, ensure_installed)

    if #to_install > 0 then
      ts.install(to_install)
    end
  end,
}
