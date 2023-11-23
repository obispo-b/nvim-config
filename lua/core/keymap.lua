local M = {}

M.nmap = function(keys, func, desc)
  vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
end

M.xmap = function(keys, func, desc)
  vim.keymap.set('x', keys, func, { buffer = bufnr, desc = desc })
end

M.tmap = function(keys, func, desc)
  vim.keymap.set('t', keys, func, { buffer = bufnr, desc = desc })
end

M.imap = function(keys, func, desc)
  vim.keymap.set('i', keys, func, { buffer = bufnr, desc = desc })
end

M.vmap = function(keys, func, desc)
  vim.keymap.set('v', keys, func, { buffer = bufnr, desc = desc })
end

return M
