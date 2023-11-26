local nmap = require('core.keymap').nmap
local xmap = require('core.keymap').xmap

vim.g.mapleader = ' '

local formatAndSave = function()
  vim.lsp.buf.format()
  vim.cmd 'w'
end

nmap('<leader>w', formatAndSave, 'Format and save buffer')
nmap('<leader>q', '<cmd>qa!<cr>', 'Quit without saving')

nmap('n', 'nzzzv', 'Move to next search match and center')
nmap('N', 'nzzzv', 'Move to previous search match and center')

xmap('<leader>p', '"_dP', 'Paste without overwriting clipboard')
nmap('<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], 'Replace word under cursor in buffer')

nmap('<esc>', '<cmd>noh<cr>', 'Clear search highlights')

nmap('<leader>,', '<C-^>', 'Alternate between buffers')

-- Switch between split windows using Ctrl + hjkl
nmap('<C-h>', '<C-w>h', 'Move to left split')
nmap('<C-j>', '<C-w>j', 'Move to bottom split')
nmap('<C-k>', '<C-w>k', 'Move to top split')
nmap('<C-l>', '<C-w>l', 'Move to right split')
