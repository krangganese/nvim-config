return {
  "saghen/blink.cmp",
  -- load only when entering insert mode to keep startup fast
  event = "InsertEnter",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = {
      preset = "default",
      ["<C-l>"] = { "show", "fallback" },
      ["<C-j>"] = { "select_next", "fallback" },
      ["<C-k>"] = { "select_prev", "fallback" },
      ["<C-y>"] = { "accept", "fallback" },
    },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      -- automatically show function/symbol docs alongside completion items
      documentation = { auto_show = true },
    },
    signature = { enabled = true },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    -- use prebuilt Rust matcher for fast, typo-resistant filtering
    fuzzy = { implementation = "prefer_rust_with_warning" },
  },
  opts_extend = { "sources.default" },
}
