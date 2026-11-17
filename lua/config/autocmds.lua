local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- briefly flash yanked text for visual feedback
autocmd("TextYankPost", {
  group = augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank({ timeout = 150 })
  end,
})

-- close utility & info windows quickly with 'q'
autocmd("FileType", {
  group = augroup("close-with-q", { clear = true }),
  pattern = { "help", "lspinfo", "notify", "qf", "checkhealth" },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<CR>", { buffer = event.buf, silent = true })
  end,
})

-- keep splits equally sized when the terminal window is resized
autocmd("VimResized", {
  group = augroup("resize-splits", { clear = true }),
  callback = function()
    local current_tab = vim.fn.tabpagenr()
    vim.cmd("tabdo wincmd =")
    vim.cmd("tabnext " .. current_tab)
  end,
})
