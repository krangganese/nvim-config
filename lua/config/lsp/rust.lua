local lspconfig = require('lspconfig')

lspconfig.rust_analyzer.setup({
  settings = {
    ['rust-analyzer'] = {
      assist = {
        importGranularity = 'module',
        importPrefix = 'by_self',
      },
      cargo = {
        allFeatures = true,
      },
      checkOnSave = {
        command = 'clippy',
      },
    },
  },
})

