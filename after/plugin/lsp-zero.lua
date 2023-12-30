local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.on_attach(function(client, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP ' .. desc
    end
    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc, remap = false })
  end

  -- Mappings
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('gd', vim.lsp.buf.definition, 'Goto Definition')
  nmap('gD', vim.lsp.buf.declaration, 'Goto Declaration')
  nmap('gi', vim.lsp.buf.implementation, 'Goto Implementation')
  nmap('go', vim.lsp.buf.type_definition, 'Goto Type Definition')
  nmap('gr', vim.lsp.buf.references, 'Goto References')
  nmap('gs', vim.lsp.buf.signature_help, 'Signature Help')
  nmap('ld', vim.diagnostic.open_float, 'Open Diagnostics')
  nmap('[d', vim.diagnostic.goto_prev, 'Goto Previous Diagnostic')
  nmap(']d', vim.diagnostic.goto_next, 'Goto Next Diagnostic')
  nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
  nmap('<leader>fm', vim.lsp.buf.format, 'Format')
  nmap('<leader>ca', vim.lsp.buf.code_action, 'Code Action')

  -- Telescope
  nmap('<leader>ls', '<cmd>Telescope lsp_document_symbols<cr>', 'Document Symbols')
  nmap('<leader>ws', '<cmd>Telescope lsp_dynamic_workspace_symbols<cr>', 'Workspace Symbols')
  nmap('<leader>ld', '<cmd>Telescope diagnostics<cr>', 'Workspace Diagnostics')
  nmap('<leader>rs', '<cmd>Telescope resume<cr>', 'Resume Last Telescope Session')
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'bashls',
    'dockerls',
    'docker_compose_language_service',
    'tsserver',
    'vimls',
    'html',
    'cssls',
    'rust_analyzer',
  },
  handlers = {
    lsp.default_setup,
  },
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
