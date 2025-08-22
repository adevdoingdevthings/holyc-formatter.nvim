-- Copyright (C) 2025 LandenHM
--
-- This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License along with this program. If not, see <https://www.gnu.org/licenses/>.

local M = {}
local NS = vim.api.nvim_create_namespace('holyc_formatter')

function M.detect_and_indicate()
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(buf, 'filetype')
  vim.api.nvim_buf_clear_namespace(buf, NS, 0, -1)
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

  for i, line in ipairs(lines) do
    local line_num = i - 1 -- Lua is 1-indexed, Neovim API is 0-indexed

    local sp_match = string.find(line, '%$[%$]?SP,.-%s*%$[%$]?')
    if sp_match then
      vim.api.nvim_buf_set_virtual_text(buf, NS, line_num, {
        { '[🖼️Image]' }
      }, {})
    end
    local ib_match = string.find(line, '%$[%$]?IB,.-%s*%$[%$]?')
    if ib_match then
      vim.api.nvim_buf_set_virtual_text(buf, NS, line_num, {
        { '[📦Model]' }
      }, {})
    end
  end
end

function M.setup()
  vim.api.nvim_create_autocmd({ 'BufReadPost', 'TextChanged' }, {
    group = vim.api.nvim_create_augroup('HolyCFormatter', { clear = true }),
    pattern = { '*.hc', '*.HC', '*.dd', '*.DD' },
    callback = M.detect_and_indicate,
  })
end

return M
