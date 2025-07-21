-- vim.lsp.config('ts_ls', {
--   filetypes = {
--     "javascript",
--     "javascriptreact",
--     "javascript.jsx",
--     "typescript",
--     "typescriptreact",
--     "typescript.tsx"
--   },
--   on_attach = function(client, bufnr)
--     if client.server_capabilities.semanticTokensProvider and client.supports_method('textDocument/semanticTokens/full') then
--       vim.lsp.semantic_tokens.start(bufnr, client.id)
--     end
--   end
-- })

-- vim.lsp.enable('ts_ls')

local lspconfig = require('lspconfig')

lspconfig.ts_ls.setup {
filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx"
  },
  init_options = {
    preferences = {
      includeCompletionsForModuleExports = true,
    },
    hostInfo = "neovim",
  },
  settings = {
    javascript = {
      validate = {
        enable = true
      },
      implicitProjectConfig = {
        checkJs = true,
      },
    },
    typescript = {
      validate = {
        enable = true
      }
    }
  },
  on_attach = function(client, bufnr)
    if client.server_capabilities.semanticTokensProvider and client.supports_method('textDocument/semanticTokens/full') then
      vim.lsp.semantic_tokens.start(bufnr, client.id)
    end
  end
}
