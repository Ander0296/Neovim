if vim.g.vscode then
    return {}
end

return{
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {

        -- ANIMATE CONFIG 
        animate = { enable = true, fps = 60,
            resize = { timing = 0.2, damping = 1.0 },
            omen = { timing = 0.3, damping = 1.0 },
            close = { timing = 0.2, damping = 1.0 },
        },
        bigfile = { enabled = true },

        -- CONFIG DASHBOARD
        dashboard = { 
            enabled = true,
            sections = {
                { section = "header" },

                -- {
                --     pane = 2,
                --     section = "terminal",
                --     cmd = "colorscript -e square",
                --     height = 5,
                --     padding = 1,
                -- },
                {
                    pane = 2,
                    icon = " ",
                    desc = "Browse Repo",
                    padding = 1,
                    key = "b",
                    action = function()
                        Snacks.gitbrowse()
                    end,
                },
                function()
                    local in_git = Snacks.git.get_root() ~= nil

                    return {
                        vim.tbl_extend("force", {
                            pane = 2,
                            section = "terminal",
                            enabled = in_git,
                            padding = 1,
                            ttl = 5 * 60,
                            indent = 3,
                        }, {
                            title = "Notifications",
                            cmd = "gh notify -s -a -n5",
                            action = function()
                                vim.ui.open("https://github.com/notifications")
                            end,
                            key = "n",
                            icon = " ",
                            height = 5,
                        }),
                    }
                end,
                { section = "keys", gap = 1, padding = 1 },
                { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
                { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
                {
                    pane = 2,
                    icon = " ",
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

        -- CONFIG EXPLORER
        explorer = { 
            enabled = true 
        },
        indent = { enabled = true },
        input = { enabled = true },

        -- CONFIG NOTIFIER
        notifier = {
            enabled = true,
            timeout = 3000,
        },

        -- CONFIG PICKER
        picker = { 
            enabled = true 
        },

        quickfile = { enabled = true },
        scope = { enabled = true },
        scroll = { enabled = true },
        statuscolumn = { enabled = true },
        words = { enabled = true },
        styles = {
            notification = {
                -- wo = { wrap = true } -- Wrap notifications
            }
        }
    },
    init = function()
        vim.api.nvim_create_autocmd("User", {
            pattern = "VeryLazy",
            callback = function()
                _G.di = function(...)
                    Snacks.debug.inspect(...)
                end
                _G.dt = function()
                    Snacks.debug.backtrace()
                end

                Snacks.toggle.option("spell", { name = "Ortografía" }):map("<leader>tos")
                Snacks.toggle.option("wrap", { name = "Ajuste de línea" }):map("<leader>tow")
                Snacks.toggle.option("relativenumber", { name = "Números relativos" }):map("<leader>tor")
                Snacks.toggle.diagnostics({ name = "Diagnósticos" }):map("<leader>tod")
                Snacks.toggle.line_number({ name = "Mostrar números de línea" }):map("<leader>tol")
                Snacks.toggle
                .option("conceallevel", {
                    off = 0,
                    on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2,
                    name = "Ocultar caracteres especiales",
                })
                :map("<leader>toc")
                Snacks.toggle.treesitter({ name = "Treesitter" }):map("<leader>tot")
                Snacks.toggle
                .option("background", {
                    off = "light",
                    on = "dark",
                    name = "Modo oscuro/claro",
                })
                :map("<leader>tob")
                Snacks.toggle.inlay_hints({ name = "Pistas de tipos" }):map("<leader>toi")
                Snacks.toggle.indent({ name = "Guías de indentación" }):map("<leader>toI")
                Snacks.toggle.dim({ name = "Oscurecer código inactivo" }):map("<leader>toD")
                Snacks.toggle.zen({ name = "Modo sin distracciones" }):map("<leader>toz")

                local map = function(keys, func, desc, modes)
                    vim.keymap.set(modes or { "n" }, keys, func, { desc = desc })
                end

                -- Pickers
                map("<leader>pp", function()
                    Snacks.picker.files({
                        cwd = vim.fn.stdpath("config") .. "/lua/plugins"
                    })
                end, "📂 Picker: Archivos de plugins")
                map("<leader>plr", function()
                    Snacks.picker.lsp_references({ title = "📌 Referencias LSP" })
                end, "Picker: Referencias LSP")
                map("<leader>plD", function()
                    Snacks.picker.lsp_declarations({ title = "📄 Declaraciones LSP" })
                end, "Picker: Ir a declaración")
                map("<leader>pld", function()
                    Snacks.picker.lsp_definitions({ title = "🔎 Definiciones LSP" })
                end, "Picker: Ir a definición")
                map("<leader>pr", function()
                    Snacks.picker.registers({ title = "📋 Registros copiados" })
                end, "Picker: Registros copiados")
                map("<leader>pk", function()
                    Snacks.picker.keymaps({ title = "🎹 Atajos de teclado" })
                end, "Picker: Keymaps")
                map("<leader>ph", function()
                    Snacks.picker.help({ title = "📚 Ayuda de Neovim" })
                end, "Picker: Buscar ayuda")
                map("<leader>pC", function()
                    Snacks.picker.colorschemes({ title = "🎨 Colores disponibles" })
                end, "Picker: Colores (colorschemes)")
                map("<leader> ", function()
                    Snacks.picker.smart({ multi = { "buffers", "files" } })
                end, "Picker buscar archivos o buffers")
                map("<leader>pn", function()
                    Snacks.picker.treesitter()
                end, "Picker buscar nodos Treesitter")
                map("<leader>pb", function()
                    Snacks.picker.buffers()
                end, "Picker buscar buffers")
                map("<leader>pt", function()
                    Snacks.picker.grep()
                end, "Picker buscar texto")
                map("<leader>ph", function()
                    Snacks.picker.help()
                end, "Picker buscar ayuda")
                map("<leader>ps", function()
                    Snacks.picker.git_status()
                end, "Picker buscar archivos modificados")
                map("<leader>pc", function()
                    Snacks.picker.command_history()
                end, "Picker buscar comando")
                map("<leader>pi", function()
                    Snacks.picker.icons()
                end, "Picker buscar ícono")
                map("<leader>pI", function()
                    Snacks.picker.icons()
                end, "Picker buscar ícono", { "i" })

                -- Explorador
                map("<leader>ee", function()
                    Snacks.explorer()
                end, "Explorador de archivos", { "n", "i" })

                -- Scratch
                map("<leader>.", function()
                    Snacks.scratch()
                end, "Abrir buffer temporal")
                map("<leader>S", function()
                    Snacks.scratch.select()
                end, "Seleccionar buffer temporal")

                -- Misceláneo
                map("<leader>bd", function()
                    Snacks.bufdelete()
                end, "Cerrar buffer")
                map("<leader>rn", function()
                    Snacks.rename.rename_file()
                end, "Renombrar archivo")
                map("<leader>te", function()
                    Snacks.terminal()
                end, "Alternar terminal", { "n", "t" })
                map("[n", function()
                    Snacks.words.jump(vim.v.count1)
                end, "Referencia siguiente")
                map("]p", function()
                    Snacks.words.jump(-vim.v.count1)
                end, "Referencia anterior")

                -- Git
                map("<leader>pgf", function()
                    Snacks.picker.git_files({ title = "🗂 Archivos de Git" })
                end, "Picker: Archivos Git")
                map("<leader>gB", function()
                    Snacks.gitbrowse()
                end, "Explorar en Git", { "n", "v" })
                map("<leader>gb", function()
                    Snacks.git.blame_line()
                end, "Responsable de línea", { "n", "v" })
                map("<leader>gf", function()
                    Snacks.lazygit.log_file()
                end, "Historial del archivo actual (Lazygit)")
                map("<leader>lG", function()
                    Snacks.lazygit()
                end, "Abrir Lazygit")
                map("<leader>ll", function()
                    Snacks.lazygit.log()
                end, "Historial del repositorio (Lazygit)")

                -- Notificaciones
                map("<leader>nn", function()
                    Snacks.notifier.show_history()
                end, "Historial de notificaciones")
                map("<leader>nd", function()
                    Snacks.notifier.hide()
                end, "Ocultar notificaciones")
            end,
        })
        -- Corregir retraso de espacio en insert
        vim.api.nvim_create_autocmd("InsertEnter", {
            callback = function()
                vim.o.timeoutlen = 10
            end,
        })

        vim.api.nvim_create_autocmd("InsertLeave", {
            callback = function()
                vim.o.timeoutlen = 500
            end,
        })
        -- 🔧 Corregir retraso en modo terminal
        vim.api.nvim_create_autocmd("TermEnter", {
            callback = function()
                vim.o.timeoutlen = 10
            end,
        })

        vim.api.nvim_create_autocmd("TermLeave", {
            callback = function()
                vim.o.timeoutlen = 500
            end,
        })
    end,
}
