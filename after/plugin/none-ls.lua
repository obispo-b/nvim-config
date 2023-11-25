local null_ls = require 'null-ls'

local builtin = null_ls.builtins

local sources = {
  -- webdev
  builtin.formatting.deno_fmt,
  builtin.formatting.prettier.with { filetypes = { 'html', 'markdown', 'css', 'javascript' } },

  -- bash
  builtin.formatting.shfmt,

  -- Lua
  builtin.formatting.stylua,

  -- C/C++
  builtin.formatting.clang_format,
}

null_ls.setup {
  sources = sources,
}
