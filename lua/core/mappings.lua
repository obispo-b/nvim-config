local nmap = require("core.keymap").nmap
local xmap = require("core.keymap").xmap

vim.g.mapleader = " "
nmap("<leader>e", "<cmd>Lexplore<cr>", "Open command line window")
-- vim.keymap.set("n", "<leader>e", vim.cmd.Ex)

local formatAndSave = function()
	vim.lsp.buf.format()
	vim.cmd("w")
end

nmap("<leader>w", formatAndSave, "Format and save buffer")
nmap("<leader>q", "<cmd>qa!<cr>", "Quit without saving")

nmap("n", "nzzzv", "Move to next search match and center")
nmap("N", "nzzzv", "Move to previous search match and center")

xmap("<leader>p", '"_dP', "Paste without overwriting clipboard")
nmap("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Switch between split windows using Ctrl + hjkl
nmap("<C-l>", "<C-w>l")
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
