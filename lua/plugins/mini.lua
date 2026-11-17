return {
  "echasnovski/mini.nvim",
  version = false,
  event = "VeryLazy",
  init = function()
    -- shim nvim-web-devicons with mini.icons to avoid needing a second icon plugin
    package.preload["nvim-web-devicons"] = function()
      require("mini.icons").mock_nvim_web_devicons()
      return package.loaded["nvim-web-devicons"]
    end
  end,
  config = function()
    -- text editing helpers (textobjects, alignment, comments, auto-pairs, surround)
    require("mini.ai").setup()
    require("mini.align").setup()
    require("mini.comment").setup()
    require("mini.move").setup()
    require("mini.pairs").setup()
    require("mini.splitjoin").setup()
    require("mini.surround").setup()

    -- lightweight UI components
    require("mini.icons").setup()
    require("mini.statusline").setup()
    require("mini.tabline").setup()
    require("mini.cursorword").setup()
    require("mini.indentscope").setup({
      symbol = "│",
      options = { try_as_border = true },
    })
  end,
}
