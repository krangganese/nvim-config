return {
  -- file explorer (lazy-loaded on keymap or when opening a directory)
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    cmd = { "NvimTreeToggle", "NvimTreeFocus", "NvimTreeFindFile" },
    keys = {
      { "<C-b>", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file explorer" },
      { "<leader>e", "<cmd>NvimTreeFocus<CR>", desc = "Focus file explorer" },
    },
    init = function()
      -- load nvim-tree immediately only when nvim is launched with a directory path (e.g. `nvim .`)
      if vim.fn.argc(-1) == 1 then
        local stat = (vim.uv or vim.loop).fs_stat(vim.fn.argv(0))
        if stat and stat.type == "directory" then
          require("nvim-tree")
        end
      end
    end,
    opts = {
      sort = { sorter = "case_sensitive" },
      view = { width = 32 },
      renderer = {
        group_empty = true,
        icons = {
          show = { file = true, folder = true, folder_arrow = true, git = true },
        },
      },
      diagnostics = { enable = true, show_on_dirs = true },
      filters = {
        dotfiles = false, -- keep .env and config dotfiles visible
        custom = { "^.git$", "^.dart_tool$", "^.idea$" },
      },
    },
  },

  -- fast fuzzy finder for files, grep, and LSP pickers
  {
    "ibhagwan/fzf-lua",
    event = "VeryLazy",
    cmd = "FzfLua",
    keys = {
      {
        "<leader>ff",
        function()
          require("fzf-lua").files()
        end,
        desc = "Find files",
      },
      {
        "<leader>fg",
        function()
          require("fzf-lua").live_grep()
        end,
        desc = "Live grep",
      },
      {
        "<leader>fb",
        function()
          require("fzf-lua").buffers()
        end,
        desc = "Find buffers",
      },
      {
        "<leader>fh",
        function()
          require("fzf-lua").helptags()
        end,
        desc = "Help tags",
      },
      {
        "<leader>fk",
        function()
          require("fzf-lua").keymaps()
        end,
        desc = "Keymaps",
      },
      {
        "<leader>fw",
        function()
          require("fzf-lua").grep_cword()
        end,
        desc = "Find word",
      },
      {
        "<leader>fW",
        function()
          require("fzf-lua").grep_cWORD()
        end,
        desc = "Find WORD",
      },
      {
        "<leader>fd",
        function()
          require("fzf-lua").diagnostics_workspace()
        end,
        desc = "Workspace diagnostics",
      },
      {
        "<C-p>",
        function()
          require("fzf-lua").git_files()
        end,
        desc = "Git files",
      },
    },
    opts = {
      -- exclude heavy build/cache folders from search results
      files = {
        rg_opts = "--files --hidden -g !.git -g !node_modules -g !dist -g !.dart_tool -g !build -g !.gradle -g !.idea",
      },
      grep = {
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --hidden -g !.git -g !node_modules -g !dist -g !.dart_tool -g !build -g !.gradle -g !.idea",
      },
    },
    config = function(_, opts)
      local fzf = require("fzf-lua")
      fzf.setup(opts)
      -- route vim.ui.select (code actions, flutter device/emulator pickers) through fzf-lua
      fzf.register_ui_select()
    end,
  },

  -- popup helper showing available keybindings after pressing <leader>
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
      delay = 300,
      spec = {
        { "<leader>f", group = "find" },
        { "<leader>F", group = "flutter" },
        { "<leader>d", group = "debug" },
        { "<leader>b", group = "bun / buffer" },
        { "<leader>c", group = "code" },
        { "<leader>w", group = "workspace" },
        { "<leader>t", group = "toggle" },
      },
    },
  },
}
