function vim.getVisualSelection()
  vim.cmd('noau normal! "vy"')
  local text = vim.fn.getreg('v')
  vim.fn.setreg('v', {}) -- clear register
  text = string.gsub(text, "\n", "") -- remove newlines
  return text
end
