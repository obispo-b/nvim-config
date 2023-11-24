local null_ls = require("null-ls")

local builtin = null_ls.builtins

local sources = {
	-- webdev stuff
	builtin.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
	builtin.formatting.prettier.with({ filetypes = { "html", "markdown", "css", "javascript" } }), -- so prettier works only on these filetypes

	-- Lua
	builtin.formatting.stylua,

	-- cpp
	builtin.formatting.clang_format,
}

null_ls.setup({
	sources = sources,
})
