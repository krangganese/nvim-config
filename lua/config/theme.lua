local M = {}

function M.setup()
  require('catppuccin').setup({
    flavour = "mocha",
    transparent_background = false,
    integrations = {
      treesitter = true,
      telescope = true,
      mini = true,
    }
  })

  vim.cmd.colorscheme "catppuccin"
end

return M
