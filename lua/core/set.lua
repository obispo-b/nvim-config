-- Theme
vim.cmd.colorscheme("gruvbox-material")

-- Show line numbers
vim.wo.number = true
vim.wo.relativenumber = true

-- Show cursor line
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Share clipboard between vim and system
vim.o.clipboard = "unnamedplus"

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Terminal
vim.o.termguicolors = true

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 2

-- Scroll offset
vim.opt.scrolloff = 8

-- Disable highlight on search
vim.opt.hlsearch = false

-- Show sign column
vim.wo.signcolumn = "yes"

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"
