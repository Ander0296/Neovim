return{
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "windwp/nvim-ts-autotag",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    event  = "VeryLazy",
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
            "java",
            "json",
            "yaml",
            "bash",
            "dockerfile",
            "gitignore",
            "lua",
            "vim",
            "markdown",
            "sql",
            "xml",
            "html",
            "css",
            "markdown_inline",
            "graphql",
            "query",
            "vimdoc",
            "c",
            "python",
            "go",
            "javascript",
        },
        highlight = {
            enable = true,
        },
        indent = { 
            enable = true,
        },
        autotag = {
            enable = not vim.g.vscode,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<CR>", -- Enter para iniciar selección
                node_incremental = "<Tab>", -- Tab para expandir
                node_decremental = "<S-Tab>", -- Shift+Tab para reducir
                scope_incremental = false,
            },
        },
        textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["af"] = "@function.outer",
						["if"] = "@function.inner",
						["ac"] = "@conditional.outer",
						["ic"] = "@conditional.inner",
						["al"] = "@loop.outer",
						["il"] = "@loop.inner",
					},
				},
			},
    },
}
