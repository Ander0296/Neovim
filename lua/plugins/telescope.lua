return {
    "nvim-telescope/telescope.nvim",
    event = "VeryLazy",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make"
        }
    },
    opts = {
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
        }
    },
    config = function(opts)
        require("telescope").setup(opts)
        require("telescope").load_extension("fzf")
    end,
    keys = {
        {
            "<leader>tp",
            function()
                require("telescope.builtin").find_files({
                    prompt_title = "Plugins",
                    cwd = "~/.config/nvim/lua/plugins",
                    attach_mappings = function(_, map)
                        local actions = require("telescope.actions")
                        local actions_state = require("telescope.actions.state")
                        map("i", "<CR>", function(prompt_bufnr)
                            local new_plugin = actions_state.get_current_line()
                            actions.close(prompt_bufnr)
                            vim.cmd(string.format("edit ~/.config/nvim/lua/plugins/%s.lua", new_plugin))
                        end)
                        return true
                    end,
                })
            end,
            desc = "Telescope carpeta de plugins"
        },
        {
            "<leader>tf",
            function()
                require("telescope").extensions.file_browser.file_browser({ path = "%:h:p", select_buffer = true })
            end,
            desc = "Telescope archivos en la carpeta"
        },
    }

}
