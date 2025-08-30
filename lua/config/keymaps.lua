local keymap = vim.keymap.set
local api = require("nvim-tree.api")
local fzf = require("fzf-lua")

-- Telescope
keymap("n", "<leader>ff", fzf.files, { desc = "Fzf find files in current working directory" })
keymap("n", "<leader>fg", fzf.live_grep,  { desc = "Fzf Live grep current project" })
keymap("n", "<leader>fb", fzf.buffers,    { desc = "Fzf file buffers" })
keymap("n", "<leader>fh", fzf.helptags,  { desc = "Fzf help tags" })
keymap("n", "<leader>fk", fzf.keymaps,  { desc = "Fzf keymaps" })
keymap("n", "<leader>fw", fzf.grep_cword,  { desc = "Fzf find current word" })
keymap("n", "<leader>fk", fzf.grep_cWORD,  { desc = "Fzf find current WORD" })
keymap("n", "<C-p>", fzf.git_files, { desc = "Fzf git files" })

-- Tree
keymap("n", "<C-b>", api.tree.toggle, { desc = "Toggle file explorer" })
keymap("n", "<leader>e", api.tree.focus, { desc = "Change focus to file explorer" })

-- General
keymap("n", "<leader>qq", "<cmd>q!<CR>", { desc = "Force quit" })
keymap("n", "<leader>w",  "<cmd>w<CR>",  { desc = "Save file" })
keymap("n", "<C-v>", '"+p', { desc = "Paste from system clipboard" })
keymap("i", "<C-v>", '<C-r>+', { desc = "Paste from system clipboard (insert mode)" })

-- Diagnostics
keymap(
  "n",
  "gl",
  vim.diagnostic.open_float,
  {desc = "Open Diagnostics in Float"}
)
