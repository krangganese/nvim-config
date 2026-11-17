local keymap = vim.keymap.set

-- general
keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
keymap("n", "<leader>qq", "<cmd>qa!<CR>", { desc = "Force quit" })
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
keymap("n", "<C-v>", '"+p', { desc = "Paste from system clipboard" })
keymap("i", "<C-v>", "<C-r>+", { desc = "Paste from system clipboard (insert)" })

-- window navigation
keymap("n", "<C-h>", "<C-w><C-h>", { desc = "Focus left window" })
keymap("n", "<C-l>", "<C-w><C-l>", { desc = "Focus right window" })
keymap("n", "<C-j>", "<C-w><C-j>", { desc = "Focus lower window" })
keymap("n", "<C-k>", "<C-w><C-k>", { desc = "Focus upper window" })

-- buffers
keymap("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
keymap("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- diagnostics
keymap("n", "gl", vim.diagnostic.open_float, { desc = "Open diagnostics float" })

-- bun
keymap(
  "n",
  "<leader>br",
  "<cmd>w<CR><cmd>botright 12split | term bun run %<CR>",
  { desc = "Bun run file" }
)
keymap("n", "<leader>bt", "<cmd>botright 12split | term bun test<CR>", { desc = "Bun test" })
keymap("n", "<leader>bi", "<cmd>botright 12split | term bun install<CR>", { desc = "Bun install" })

-- terminal
keymap("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
