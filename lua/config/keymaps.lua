local keymap = vim.keymap.set
local builtin = require("telescope.builtin")
local api = require("nvim-tree.api")

-- Telescope
keymap("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
keymap("n", "<leader>fg", builtin.live_grep,  { desc = "Telescope live grep" })
keymap("n", "<leader>fb", builtin.buffers,    { desc = "Telescope buffers" })
keymap("n", "<leader>fh", builtin.help_tags,  { desc = "Telescope help tags" })
keymap("n", "<C-p>", builtin.git_files, { desc = "Telescope git files" })

-- Tree
keymap("n", "<C-b>", api.tree.toggle, { desc = "Toggle file explorer" })
keymap("n", "<leader>e", api.tree.focus, { desc = "Change focus to file explorer" }) 

-- General
keymap("n", "<leader>qq", "<cmd>q!<CR>", { desc = "Force quit" })
keymap("n", "<leader>w",  "<cmd>w<CR>",  { desc = "Save file" })
keymap("n", "<C-v>", '"+p', { desc = "Paste from system clipboard" })
keymap("i", "<C-v>", '<C-r>+', { desc = "Paste from system clipboard (insert mode)" })
