-- Telescope: fuzzy finder para archivos, texto, buffers, etc.
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") }) end, desc = "Archivos (directorio actual)" },
    { "<leader><leader>", function() require("telescope.builtin").find_files() end, desc = "Archivos (raíz del proyecto)" },
    { "<leader>fg", function() require("telescope.builtin").git_files() end, desc = "Archivos de Git" },
    { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers abiertos" },
    { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Ayuda de Telescope" },
    { "<leader>f:", function() require("telescope.builtin").command_history() end, desc = "Historial de comandos" },
    { "<leader>fo", function() require("telescope.builtin").oldfiles() end, desc = "Archivos recientes" },
    { "<leader>fr", function() require("telescope.builtin").registers() end, desc = "Registros" },
    { "<leader>/", function() require("telescope.builtin").live_grep() end, desc = "Buscar texto (proyecto)" },
    { "<leader>fw", function() require("telescope.builtin").grep_string({ cwd = vim.fn.expand("%:p:h") }) end, desc = "Buscar palabra (directorio actual)" },
    { "<leader>fW", function() require("telescope.builtin").grep_string() end, desc = "Buscar palabra (raíz del proyecto)" },
    {
      "<leader>fp",
      function()
        local pickers = require("telescope.pickers")
        local finders = require("telescope.finders")
        local conf = require("telescope.config").values
        local actions = require("telescope.actions")
        local action_state = require("telescope.actions.state")

        local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"
        -- Obtener archivos de plugins existentes
        local entries = {}
        local handle = vim.loop.fs_scandir(plugins_dir)
        if handle then
          while true do
            local name, ftype = vim.loop.fs_scandir_next(handle)
            if not name then break end
            if ftype == "file" and name:match("%.lua$") then
              table.insert(entries, (name:gsub("%.lua$", "")))
            end
          end
        end
        table.sort(entries)

        pickers.new(require("telescope.themes").get_ivy({}), {
          prompt_title = "Plugins",
          finder = finders.new_table({ results = entries }),
          sorter = conf.generic_sorter({}),
          attach_mappings = function(prompt_bufnr, map)
            -- Abrir archivo seleccionado o existente
            actions.select_default:replace(function()
              local selection = action_state.get_selected_entry()
              if not selection then return end
              actions.close(prompt_bufnr)
              vim.cmd("edit " .. plugins_dir .. "/" .. selection[1] .. ".lua")
            end)

            -- Ctrl+n: crear archivo nuevo con lo que escribiste
            map("i", "<C-n>", function()
              local input = action_state.get_current_line()
              actions.close(prompt_bufnr)
              if not input or input == "" then return end
              local filepath = plugins_dir .. "/" .. input .. ".lua"
              if vim.fn.filereadable(filepath) == 0 then
                local file = io.open(filepath, "w")
                if file then
                  file:write("return {\n\n}\n")
                  file:close()
                end
              end
              vim.cmd("edit " .. filepath)
            end)
            return true
          end,
        }):find()
      end,
      desc = "Plugins",
    },
  },
  config = function()
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    local delete_branch = function(prompt_bufnr)
      local selection = action_state.get_selected_entry()
      if not selection then return end
      local branch = selection.value

      -- Confirmación personalizada
      local confirm = vim.fn.confirm("¿Borrar rama '" .. branch .. "'?", "&Sí\n&No", 2)
      if confirm == 1 then
        -- Ejecutamos el comando de git directamente para evitar la confirmación doble de Telescope
        local out = vim.fn.systemlist("git branch -D " .. branch)
        if vim.v.shell_error ~= 0 then
          vim.notify("Error al borrar rama: " .. table.concat(out, " "), vim.log.levels.ERROR)
        else
          vim.notify("Rama '" .. branch .. "' borrada correctamente", vim.log.levels.INFO)
          -- Refrescar el picker cerrando y abriendo o simplemente borrando la entrada
          actions.close(prompt_bufnr)
          require("telescope.builtin").git_branches()
        end
      end
    end

    require("telescope").setup({
      defaults = require("telescope.themes").get_ivy({
        file_ignore_patterns = { "node_modules", ".git/" },
      }),
      pickers = {
        git_branches = {
          mappings = {
            i = {
              ["<C-n>"] = actions.git_create_branch,
              ["<C-d>"] = delete_branch,
            },
            n = {
              ["<C-d>"] = delete_branch,
            },
          },
        },
      },
    })
    require("telescope").load_extension("fzf")
  end,
}
