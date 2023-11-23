local nmap = require("core.keymap").nmap

local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    nmap('K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    nmap('gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    nmap('gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    nmap('gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    nmap('go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    nmap('gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    nmap('gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    nmap('<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    nmap('<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    nmap('gl', '<cmd>lua vim.diagnostic.open_float()<cr>', opts)
    nmap('[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>', opts)
    nmap(']d', '<cmd>lua vim.diagnostic.goto_next()<cr>', opts)
    nmap('<leader>fm', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    nmap('<leader>ls', '<cmd>Telescope lsp_document_symbols<CR>', opts)
    nmap('<leader>ld', '<cmd>Telescope diagnostics<CR>', opts)
  end,
})
local default_setup = function(server)
  lspconfig[server].setup({
    capabilities = lsp_capabilities,
  })
end

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
  },
  handlers = { default_setup },
})

local cmp = require('cmp')

cmp.setup({
  sources = {
    { name = 'nvim_lsp' },
  },
  mapping = cmp.mapping.preset.insert({
    -- Enter key confirms completion item
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    -- Ctrl + space triggers completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
})
