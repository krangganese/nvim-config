return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  cmd = {
    "LspInfo",
    "Mason",
    "MasonInstall",
    "MasonUninstall",
    "MasonToolsInstall",
    "MasonToolsInstallSync",
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "mason-org/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    { "j-hui/fidget.nvim", opts = {} },
    "saghen/blink.cmp",
  },
  config = function()
    -- register buffer-local LSP keymaps and features once a language server attaches
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
      callback = function(event)
        local fzf = require("fzf-lua")
        local map = function(keys, func, desc, mode)
          mode = mode or "n"
          vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", fzf.lsp_definitions, "Goto Definition")
        map("gr", fzf.lsp_references, "Goto References")
        map("gI", fzf.lsp_implementations, "Goto Implementation")
        map("<leader>D", fzf.lsp_typedefs, "Type Definition")
        map("<leader>ds", fzf.lsp_document_symbols, "Document Symbols")
        map("<leader>ws", fzf.lsp_live_workspace_symbols, "Workspace Symbols")
        map("<leader>cr", vim.lsp.buf.rename, "Rename")
        map("<leader>ca", fzf.lsp_code_actions, "Code Action", { "n", "x" })
        map("gD", vim.lsp.buf.declaration, "Goto Declaration")
        map("K", vim.lsp.buf.hover, "Hover Documentation")

        local function client_supports_method(client, method, bufnr)
          if vim.fn.has("nvim-0.11") == 1 then
            return client:supports_method(method, bufnr)
          else
            return client.supports_method(method, { bufnr = bufnr })
          end
        end

        -- highlight references of the symbol under the cursor when idle
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if
          client
          and client_supports_method(
            client,
            vim.lsp.protocol.Methods.textDocument_documentHighlight,
            event.buf
          )
        then
          local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
            end,
          })
        end

        if
          client
          and client_supports_method(
            client,
            vim.lsp.protocol.Methods.textDocument_inlayHint,
            event.buf
          )
        then
          map("<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
          end, "Toggle Inlay Hints")
        end
      end,
    })

    vim.diagnostic.config({
      severity_sort = true,
      float = { border = "rounded", source = "if_many" },
      underline = { severity = vim.diagnostic.severity.ERROR },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "󰅚 ",
          [vim.diagnostic.severity.WARN] = "󰀪 ",
          [vim.diagnostic.severity.INFO] = "󰋽 ",
          [vim.diagnostic.severity.HINT] = "󰌶 ",
        },
      },
      virtual_text = {
        source = "if_many",
        spacing = 2,
      },
    })

    -- use Neovim 0.12 native document colors for inline color swatches (Flutter/CSS)
    if vim.lsp.document_color then
      vim.lsp.document_color.enable(true, nil, { style = "virtual" })
    end

    local client_capabilities = vim.lsp.protocol.make_client_capabilities()
    local capabilities = require("blink.cmp").get_lsp_capabilities(client_capabilities)

    -- dartls is managed by flutter-tools.nvim, so only configure Lua and Bun (TS/JS + Biome) here
    local servers = {
      lua_ls = {
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
      },
      ts_ls = {
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
        },
        init_options = {
          preferences = {
            includeCompletionsForModuleExports = true,
          },
          hostInfo = "neovim",
        },
      },
      biome = {},
    }

    local ensure_installed = vim.tbl_keys(servers)
    vim.list_extend(ensure_installed, { "stylua" })

    require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
    require("mason-lspconfig").setup({
      ensure_installed = {},
      automatic_installation = false,
    })

    for server_name, server in pairs(servers) do
      server.capabilities =
        vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
      vim.lsp.config(server_name, server)
      vim.lsp.enable(server_name)
    end
  end,
}
