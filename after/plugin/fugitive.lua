local nmap = require('core.keymap').nmap

nmap('<leader>ns', '<cmd>Git status<CR>', 'git status')
nmap('<leader>nc', '<cmd>Git commit --all<CR>', 'git commit --all')
nmap('<leader>na', '<cmd>Git add %<CR>', 'git add current file')
nmap('<leader>nA', '<cmd>Git add .<CR>', 'git add .')
