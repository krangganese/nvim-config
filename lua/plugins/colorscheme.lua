return {
  "catppuccin/nvim",
  name = "catppuccin",
  -- load immediately at startup with high priority so UI never flashes unstyled
  lazy = false,
  priority = 1000,
  opts = {
    flavour = "mocha",
    transparent_background = false,
    integrations = {
      treesitter = true,
      fzf = true,
      mini = { enabled = true },
      nvimtree = true,
      dap = true,
      dap_ui = true,
      which_key = true,
      blink_cmp = true,
    },
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
