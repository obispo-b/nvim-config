require("ibl").setup {
  indent = { char = "▏" },
  scope = {
    show_start = false,
    show_end = false,
  },
  exclude = {
    buftypes = {
      "nofile",
      "terminal",
    },
    filetypes = {
      "help",
      "startify",
      "aerial",
      "alpha",
      "dashboard",
      "lazy",
      "neogitstatus",
      "NvimTree",
      "neo-tree",
      "Trouble",
    },
  },
}

local hooks = require("ibl.hooks")

hooks.register(
  hooks.type.WHITESPACE,
  hooks.builtin.hide_first_space_indent_level
)
