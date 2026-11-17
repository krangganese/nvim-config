return {
  "nvim-treesitter/nvim-treesitter",
  branch = "master",
  -- defer loading until a file buffer is actually opened
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSUpdate", "TSInstall", "TSInstallSync" },
  build = ":TSUpdate",
  -- required on master branch so lazy.nvim passes `opts` to `nvim-treesitter.configs`
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      -- flutter & android
      "dart",
      "kotlin",
      "xml",
      "yaml",

      -- bun & web
      "typescript",
      "tsx",
      "javascript",
      "json",
      "jsonc",
      "html",
      "css",

      -- neovim config & docs
      "lua",
      "vim",
      "vimdoc",
      "toml",
      "bash",
      "markdown",
      "markdown_inline",
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  },
}
