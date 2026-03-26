return {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local map = function(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = bufnr, desc = desc })
      end

      -- Navegación entre hunks
      map("n", "]h", function() gs.nav_hunk("next") end, "Siguiente hunk")
      map("n", "[h", function() gs.nav_hunk("prev") end, "Hunk anterior")

      -- Acciones
      map("n", "<leader>gp", gs.preview_hunk, "Preview del hunk")
      map("n", "<leader>gr", gs.reset_hunk, "Revertir hunk")
      map("n", "<leader>gS", gs.stage_hunk, "Stagear hunk")
      map("n", "<leader>gu", gs.undo_stage_hunk, "Deshacer stage del hunk")
      map("v", "<leader>gr", function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Revertir selección")
      map("v", "<leader>gS", function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, "Stagear selección")

      -- Blame
      map("n", "<leader>gb", function() gs.blame_line({ full = true }) end, "Blame de la línea")
      map("n", "<leader>gB", gs.blame, "Blame del archivo")

      -- Diff
      map("n", "<leader>gd", gs.diffthis, "Diff del archivo")
    end,
  },
}
