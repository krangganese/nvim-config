local M = {}

function M.setup()
  -- Text editor
  require('mini.ai').setup()
  require('mini.align').setup()
  require('mini.comment').setup()
  require('mini.move').setup()
  require('mini.pairs').setup()
  require('mini.splitjoin').setup()
  require('mini.surround').setup()

  -- Appearance
  require('mini.icons').setup()
  require('mini.statusline').setup()
  require('mini.cursorword').setup()
  require('mini.indentscope').setup()
  require('mini.tabline').setup()
end

return M