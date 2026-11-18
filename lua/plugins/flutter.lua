return {
  "akinsho/flutter-tools.nvim",
  -- only load when opening Dart files or running Flutter commands/keymaps
  ft = "dart",
  cmd = {
    "FlutterRun",
    "FlutterDevices",
    "FlutterEmulators",
    "FlutterReload",
    "FlutterRestart",
    "FlutterQuit",
    "FlutterOutlineToggle",
    "FlutterLogToggle",
    "FlutterPubGet",
  },
  keys = {
    -- flutter workflow
    { "<leader>Fr", "<cmd>FlutterRun<CR>", desc = "Flutter run" },
    { "<leader>Fd", "<cmd>FlutterDevices<CR>", desc = "Flutter devices" },
    { "<leader>Fe", "<cmd>FlutterEmulators<CR>", desc = "Flutter emulators" },
    { "<leader>Fh", "<cmd>FlutterReload<CR>", desc = "Flutter hot reload" },
    { "<leader>FR", "<cmd>FlutterRestart<CR>", desc = "Flutter hot restart" },
    { "<leader>Fq", "<cmd>FlutterQuit<CR>", desc = "Flutter quit" },
    { "<leader>Fo", "<cmd>FlutterOutlineToggle<CR>", desc = "Flutter outline" },
    { "<leader>Fl", "<cmd>FlutterLogToggle<CR>", desc = "Flutter logs" },
    { "<leader>Fp", "<cmd>FlutterPubGet<CR>", desc = "Flutter pub get" },

    -- step debugger (DAP)
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      desc = "Toggle breakpoint",
    },
    {
      "<leader>dc",
      function()
        require("dap").continue()
      end,
      desc = "Debug continue",
    },
    {
      "<leader>di",
      function()
        require("dap").step_into()
      end,
      desc = "Step into",
    },
    {
      "<leader>do",
      function()
        require("dap").step_over()
      end,
      desc = "Step over",
    },
    {
      "<leader>dO",
      function()
        require("dap").step_out()
      end,
      desc = "Step out",
    },
    {
      "<leader>dt",
      function()
        require("dap").terminate()
      end,
      desc = "Debug terminate",
    },
    {
      "<leader>du",
      function()
        require("dapui").toggle()
      end,
      desc = "Toggle debug UI",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "saghen/blink.cmp",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup({
      icons = { expanded = "▾", collapsed = "▸", current_frame = "*" },
      layouts = {
        {
          elements = {
            { id = "scopes", size = 0.4 },
            { id = "breakpoints", size = 0.2 },
            { id = "stacks", size = 0.2 },
            { id = "watches", size = 0.2 },
          },
          position = "left",
          size = 40,
        },
        {
          elements = {
            { id = "repl", size = 0.5 },
            { id = "console", size = 0.5 },
          },
          position = "bottom",
          size = 10,
        },
      },
    })

    -- automatically open/close debug panels when a DAP session starts or ends
    dap.listeners.after.event_initialized["dapui_config"] = dapui.open
    dap.listeners.before.event_terminated["dapui_config"] = dapui.close
    dap.listeners.before.event_exited["dapui_config"] = dapui.close

    vim.fn.sign_define(
      "DapBreakpoint",
      { text = "●", texthl = "DiagnosticError", linehl = "", numhl = "" }
    )
    vim.fn.sign_define(
      "DapStopped",
      { text = "▶", texthl = "DiagnosticWarn", linehl = "Visual", numhl = "" }
    )

    local client_capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = require("blink.cmp").get_lsp_capabilities(client_capabilities)

    require("flutter-tools").setup({
      ui = {
        border = "rounded",
        notification_style = "native",
      },
      decorations = {
        statusline = {
          app_version = false,
          device = true,
          project_config = false,
        },
      },
      debugger = {
        enabled = true,
        run_via_dap = true,
        exception_breakpoints = {},
      },
      widget_guides = {
        enabled = true, -- draw vertical guide lines connecting parent/child widgets
      },
      closing_tags = {
        highlight = "Comment",
        prefix = "// ", -- show virtual closing labels on nested widget trees
        enabled = true,
      },
      dev_log = {
        enabled = true,
        notify_errors = true,
        open_cmd = "botright 12split",
        focus_on_open = false,
      },
      outline = {
        open_cmd = "30vnew",
        auto_open = false,
      },
      lsp = {
        capabilities = capabilities,
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          renameFilesWithClasses = "prompt",
          enableSnippets = true,
          updateImportsOnRename = true,
        },
      },
    })

    -- initialize flutter-tools user commands immediately once lazy.nvim loads this spec
    vim.api.nvim_exec_autocmds("BufEnter", { group = "FlutterToolsGroup", pattern = "*.dart" })
  end,
}
