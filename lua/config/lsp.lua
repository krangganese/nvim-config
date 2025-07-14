-- Load mason.nvim and mason-lspconfig.nvim
require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'rust_analyzer',
    'eslint',
    'cssls',
    'ts_ls',
    'lua_ls',
    'tailwindcss',
    'html',
    'css_variables',
    'cssmodules_ls',
  },
})


local lspconfig = require('lspconfig')

-- Load individual LSP config inside `lsp/` directory
local lsp_path = vim.fn.stdpath('config') .. '/lua/config/lsp'
for _, file in ipairs(vim.fn.readdir(lsp_path)) do
  if file:match('%.lua$') and file ~= 'init.lua' then
    require('config.lsp.' .. file:gsub('%.lua$', ''))
  end
end
