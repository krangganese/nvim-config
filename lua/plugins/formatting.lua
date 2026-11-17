return {
  "stevearc/conform.nvim",
  -- load just before saving a buffer or when formatting is triggered manually
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>bf",
      function()
        require("conform").format({ async = true, lsp_format = "fallback" })
      end,
      desc = "Format buffer",
    },
  },
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      -- use biome for fast formatting in Bun/TS/JS projects, fallback to LSP if biome isn't active
      javascript = { "biome", lsp_format = "fallback" },
      typescript = { "biome", lsp_format = "fallback" },
      javascriptreact = { "biome", lsp_format = "fallback" },
      typescriptreact = { "biome", lsp_format = "fallback" },
      json = { "biome", lsp_format = "fallback" },
      jsonc = { "biome", lsp_format = "fallback" },
      -- dart formatting is handled directly by dartls
      dart = { lsp_format = "first" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  },
}
