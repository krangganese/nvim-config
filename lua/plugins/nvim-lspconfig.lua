return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {
      "mason-org/mason.nvim",
      opts = {}
    },
    'mason-org/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    {
      "j-hui/fidget.nvim",
      opts = {},
    },
    -- 'hrsh7th/cmp-nvim-lsp'
  }
}