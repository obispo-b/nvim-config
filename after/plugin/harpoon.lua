local nmap = require("core.keymap").nmap
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

nmap("<leader>a", mark.add_file, "Harpoon add file")
nmap("<leader>h", ui.toggle_quick_menu, "Harpoon quick menu")

nmap("<leader>1", function()
	ui.nav_file(1)
end, "Harpoon to 1")
nmap("<leader>2", function()
	ui.nav_file(2)
end, "Harpoon to 2")
nmap("<leader>3", function()
	ui.nav_file(3)
end, "Harpoon to 3")
nmap("<leader>4", function()
	ui.nav_file(4)
end, "Harpoon to 4")
