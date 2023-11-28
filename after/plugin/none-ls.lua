local null_ls = require 'null-ls'

local b = null_ls.builtins

local sources = {
  -- webdev
  b.formatting.deno_fmt,
  b.formatting.prettierd, --.with { filetypes = { 'html', 'markdown', 'css', 'javascript' } },

  -- bash
  b.formatting.shfmt,

  -- Lua
  b.formatting.stylua,

  -- C/C++
  b.formatting.clang_format,
}

null_ls.setup {
  sources = sources,
}
