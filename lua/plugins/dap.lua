-- DAP: debugger con UI para Go, Python y JavaScript/TypeScript
return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "leoluz/nvim-dap-go",
      "mfussenegger/nvim-dap-python",
    },
    keys = {
      { "<leader>db", function() require("dap").toggle_breakpoint() end,                                           desc = "Breakpoint" },
      { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input("Condición: ")) end,                   desc = "Breakpoint condicional" },
      { "<leader>dc", function() require("dap").continue() end,                                                    desc = "Continuar / Iniciar" },
      { "<leader>di", function() require("dap").step_into() end,                                                   desc = "Step into" },
      { "<leader>do", function() require("dap").step_over() end,                                                   desc = "Step over" },
      { "<leader>dO", function() require("dap").step_out() end,                                                    desc = "Step out" },
      { "<leader>dt", function() require("dap").terminate() end,                                                   desc = "Terminar sesión" },
      { "<leader>dr", function() require("dap").repl.toggle() end,                                                 desc = "REPL" },
      { "<leader>du", function() require("dapui").toggle() end,                                                    desc = "Toggle UI" },
      { "<leader>de", function() require("dapui").eval() end, mode = { "n", "v" },                                desc = "Evaluar expresión" },
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Abrir/cerrar UI automáticamente al iniciar/terminar sesión
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

      -- Íconos en el gutter
      vim.fn.sign_define("DapBreakpoint",          { text = "●", texthl = "DiagnosticError" })
      vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DiagnosticWarn" })
      vim.fn.sign_define("DapStopped",             { text = "▶", texthl = "DiagnosticOk", linehl = "DapStoppedLine" })

      dapui.setup()

      -- Adapter JS/TS via js-debug-adapter (mason)
      local js_debug = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter"
      if vim.fn.isdirectory(js_debug) == 1 then
        dap.adapters["pwa-node"] = {
          type = "server",
          host = "localhost",
          port = "${port}",
          executable = {
            command = "node",
            args = { js_debug .. "/js-debug/src/dapDebugServer.js", "${port}" },
          },
        }
        for _, lang in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
          dap.configurations[lang] = {
            {
              type = "pwa-node",
              request = "launch",
              name = "Ejecutar archivo actual",
              program = "${file}",
              cwd = "${workspaceFolder}",
            },
            {
              type = "pwa-node",
              request = "attach",
              name = "Conectar a proceso Node",
              processId = require("dap.utils").pick_process,
              cwd = "${workspaceFolder}",
            },
          }
        end
      end
    end,
  },

  -- Go: usa delve via nvim-dap-go (detecta tests automáticamente)
  {
    "leoluz/nvim-dap-go",
    ft = "go",
    keys = {
      { "<leader>dgt", function() require("dap-go").debug_test() end,      desc = "Debug test (Go)" },
      { "<leader>dgl", function() require("dap-go").debug_last_test() end, desc = "Debug último test (Go)" },
    },
    opts = {},
  },

  -- Python: usa debugpy via mason
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    keys = {
      { "<leader>dpm", function() require("dap-python").test_method() end, desc = "Debug método (Python)" },
      { "<leader>dpc", function() require("dap-python").test_class() end,  desc = "Debug clase (Python)" },
    },
    config = function()
      local python = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      if vim.fn.executable(python) == 1 then
        require("dap-python").setup(python)
      end
    end,
  },
}
