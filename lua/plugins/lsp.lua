-- LSP stack completo: blink.cmp + mason + lspconfig
return {
  -- Autocompletion
  {
    "saghen/blink.cmp",
    version = "*",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      keymap = { preset = "default" },
      appearance = {
        nerd_font_variant = "mono",
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      signature = { enabled = true },
    },
  },

  -- Instalador de servidores LSP
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {},
  },

  -- Instalar formateadores y linters automáticamente
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        -- Formateadores
        "stylua",
        "prettierd",
        "black",
        "shfmt",
        "goimports",
        "rustfmt",
        -- Linters
        "eslint_d",
        "pylint",
        "golangci-lint",
      },
    },
  },

  -- Bridge mason <-> lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "saghen/blink.cmp",
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "ts_ls",
          "gopls",
          "pyright",
          "rust_analyzer",
          "clangd",
          "html",
          "cssls",
          "jsonls",
          "yamlls",
          "bashls",
          "dockerls",
          "tailwindcss",
        },
        automatic_installation = true,
        handlers = {
          function(server_name)
            require("lspconfig")[server_name].setup({
              capabilities = capabilities,
            })
          end,
          -- Lua: reconocer el global `vim`
          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup({
              capabilities = capabilities,
              settings = {
                Lua = {
                  workspace = { checkThirdParty = false },
                  telemetry = { enable = false },
                  diagnostics = { globals = { "vim" } },
                },
              },
            })
          end,
        },
      })

      -- Keymaps: se activan solo cuando un LSP se conecta al buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("user_lsp_attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = desc })
          end

          local builtin = require("telescope.builtin")

          -- Goto (convención estándar, sin leader)
          map("gd", builtin.lsp_definitions, "Ir a la definición")
          map("gr", builtin.lsp_references, "Ver referencias")
          map("gi", builtin.lsp_implementations, "Ir a la implementación")
          map("gy", builtin.lsp_type_definitions, "Ir al tipo")
          map("gD", vim.lsp.buf.declaration, "Ir a la declaración")

          -- LSP con leader (operaciones y listas)
          map("<leader>ld", builtin.lsp_definitions, "Definiciones")
          map("<leader>lr", builtin.lsp_references, "Referencias")
          map("<leader>li", builtin.lsp_implementations, "Implementaciones")
          map("<leader>le", builtin.diagnostics, "Diagnósticos")
          map("<leader>ls", builtin.lsp_document_symbols, "Símbolos del documento")
          map("<leader>lS", builtin.lsp_dynamic_workspace_symbols, "Símbolos del proyecto")

          -- Acciones de código
          map("<leader>cr", vim.lsp.buf.rename, "Renombrar símbolo")
          map("<leader>ca", vim.lsp.buf.code_action, "Acciones de código")
          map("<leader>ca", vim.lsp.buf.code_action, "Acciones de código", "v")
          map("K", vim.lsp.buf.hover, "Documentación flotante")
        end,
      })
    end,
  },
}
