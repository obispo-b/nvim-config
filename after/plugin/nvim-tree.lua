local nmap = require('core.keymap').nmap

local toggleTreeFocus = function()
  if vim.bo.filetype == 'NvimTree' then
    vim.api.nvim_input '<C-w>l'
  else
    vim.cmd 'NvimTreeFocus'
  end
end

nmap('<leader>e', '<cmd> NvimTreeToggle <CR>', 'Toggle NvimTree')
nmap('<leader>o', toggleTreeFocus, 'Toggle NvimTree Focus')
