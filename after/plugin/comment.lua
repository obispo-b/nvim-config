local nmap = require('core.keymap').nmap
local vmap = require('core.keymap').vmap

nmap("<leader>/", function() require("Comment.api").toggle.linewise.count(vim.v.count > 0 and vim.v.count or 1) end,
  "Toggle comment")
vmap("<leader>/", "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>", "Toggle comment")
