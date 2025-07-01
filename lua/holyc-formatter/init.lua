local M = {}

-- Create a unique namespace for virtual text
local NS = vim.api.nvim_create_namespace('holyc_formatter')

-- Function to detect and add indicators
function M.detect_and_indicate()
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(buf, 'filetype')

  if ft ~= 'holyc' and ft ~= 'doldoc' then
    return
  end

  -- Clear any previously set virtual text for this buffer
  vim.api.nvim_buf_clear_namespace(buf, NS, 0, -1)

  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

  for i, line in ipairs(lines) do
    local line_num = i - 1

    -- Detect $SP...$ or $$SP...$$ (Sprite/Image)
    local sp_match = string.find(line, '%$[%$]?SP,.-%s*%$[%$]?')
    if sp_match then
      vim.api.nvim_buf_set_virtual_text(buf, NS, line_num, {
        { '[🖼️Image]' }
      }, {})
    end

    -- Detect $IB...$ or $$IB...$$ (Binary/Model)
    local ib_match = string.find(line, '%$[%$]?IB,.-%s*%$[%$]?')
    if ib_match then
      vim.api.nvim_buf_set_virtual_text(buf, NS, line_num, {
        { '[📦Model]' }
      }, {})
    end
  end
end

-- Setup function for lazy.nvim
function M.setup()
  vim.api.nvim_create_autocmd({ 'BufReadPost', 'TextChanged' }, {
    group = vim.api.nvim_create_augroup('HolyCFormatter', { clear = true }),
    pattern = { '*.hc', '*.HC', '*.dd', '*.DD' },
    callback = M.detect_and_indicate,
  })
end

return M
