-- Bootstrap: clona lazy.nvim si no está instalado
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup: importa automáticamente todos los archivos en lua/plugins/
require("lazy").setup({
  { import = "plugins" },
}, {
  checker = { enabled = true, notify = false },
  change_detection = { notify = false },
})
