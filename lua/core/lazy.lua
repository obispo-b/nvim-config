local plugins = {
  { 'nvimtools/none-ls.nvim' },
  { 'tpope/vim-fugitive' },
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },
  {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    opts = {
      options = {
        icons_enabled = false,
        theme = 'gruvbox',
        component_separators = '|',
        section_separators = '',
      },
    },
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  { 'akinsho/toggleterm.nvim', version = '*', config = true },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
  { 'folke/zen-mode.nvim' },
  { 'ThePrimeagen/harpoon' },
  { 'ThePrimeagen/vim-be-good' },
  { 'github/copilot.vim' },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },
  {
    'kylechui/nvim-surround',
    version = '*', -- Use for stability; omit to use `main` branch for the latest features
    config = function()
      require('nvim-surround').setup({
        -- Configuration here, or leave empty to use defaults
      })
    end,
  },
  {
    'mrcjkb/haskell-tools.nvim',
    version = '^3', -- Recommended
    ft = { 'haskell', 'lhaskell', 'cabal', 'cabalproject' },
  },
  {
    'sainnhe/gruvbox-material',
    config = function()
      vim.g.gruvbox_material_foreground = 'original' -- material, mix, original
      vim.g.gruvbox_material_background = 'medium' -- hard, medium, soft
    end,
  },
  {
    'navarasu/onedark.nvim',
  },
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup({})
    end,
  },
  { 'mbbill/undotree' },
  -- Lsp plugins
  { 'neovim/nvim-lspconfig' },
  { 'williamboman/mason.nvim' },
  { 'L3MON4D3/LuaSnip' },
  { 'williamboman/mason-lspconfig.nvim' },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },

  { 'numToStr/Comment.nvim' },
  {
    'folke/which-key.nvim',
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  -- {
  --   'nvim-neorg/neorg',
  --   build = ':Neorg sync-parsers',
  --   dependencies = { 'nvim-lua/plenary.nvim' },
  -- },
  {
    'nvim-orgmode/orgmode',
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter', lazy = true },
    },
  },

  {
    'akinsho/org-bullets.nvim',
    config = function()
      require('org-bullets').setup({
        indent = true, -- Adds indentation guides to all levels
        show_current_line = true, -- Show current item's bullet
        concealcursor = false, -- If false then when the cursor is on a line underlying characters are visible
        symbols = {
          list = '•',
          headlines = { '◉', '○', '✸', '✿' },
          checkboxes = {
            half = { '-', 'OrgTSCheckboxHalfChecked' },
            done = { '✓', 'OrgDone' },
            todo = { ' ', 'OrgTODO' },
          },
        },
      })
    end,
  },
}

local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup(plugins, opts)
