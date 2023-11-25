local lspconfig = require 'lspconfig'
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    -- Mappings
    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<leader>fm', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

    vim.keymap.set('n', 'ld', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
    vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)

    -- nmap('<leader>ls', '<cmd>Telescope lsp_document_symbols<CR>', 'Find Symbols')
    -- nmap('<leader>ld', '<cmd>Telescope diagnostics<CR>', 'Find Diagnostics')
    -- nmap('K', '<cmd>lua vim.lsp.buf.hover()<cr>', 'LSP Hover')
    -- nmap('gd', '<cmd>lua vim.lsp.buf.definition()<cr>', 'LSP Goto Definition')
    -- nmap('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    -- nmap('gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    -- nmap('go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    -- nmap('gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    -- nmap('gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    -- nmap('<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    -- nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    -- nmap('<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    -- nmap('gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    -- nmap('[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
    -- nmap(']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
    -- nmap('<leader>fm', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    -- nmap('<leader>ls', '<cmd>Telescope lsp_document_symbols<CR>', opts)
    -- nmap('<leader>ld', '<cmd>Telescope diagnostics<CR>', opts)
  end,
})
local default_setup = function(server)
  lspconfig[server].setup {
    capabilities = lsp_capabilities,
  }
end

require('mason').setup {}
require('mason-lspconfig').setup {
  ensure_installed = {
    'lua_ls',
    'bashls',
    'dockerls',
    'docker_compose_language_service',
    'tsserver',
    'vimls',
    'html',
    'cssls',
  },
  handlers = { default_setup },
}

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {
          'vim',
          'require',
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
