local nmap = require('core.keymap').nmap
local tmap = require('core.keymap').tmap

nmap('<M-i>', '<cmd>ToggleTerm direction=float<cr>', 'Toggle terminal')
tmap('<M-i>', '<cmd>ToggleTerm direction=float<cr>', 'Toggle terminal')
