-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }

  }
  use({
      'folke/which-key.nvim',
      config = function()
        require('which-key').setup()
      end,
    })
  use({ 'rose-pine/neovim', as = 'rose-pine' })

  vim.cmd('colorscheme rose-pine-moon')

  use('folke/lazydev.nvim')

  use {
      'mason-org/mason.nvim',
      config = function()
          require('mason').setup()
      end,
  }

  use {
      'ray-x/go.nvim',
      requires = {
          'neovim/nvim-lspconfig',
          'mason-org/mason-lspconfig.nvim',
      },
  }
  use {
      'ray-x/lsp_signature.nvim',
      requires = {
          'neovim/nvim-lspconfig',
      },
      config = function()
          require('lsp_signature').setup()
      end,
  }

  use 'neovim/nvim-lspconfig'

  use {
      'mason-org/mason-lspconfig.nvim',
      requires = {
          { 'neovim/nvim-lspconfig' },
      },
      config = function()
          require('mason-lspconfig').setup()
      end,
      after = { 'mason.nvim' },
  }

  use {
      'saghen/blink.cmp',
      config = function()
          require('blink.cmp').setup({
              keymap = {
                  preset = 'default',
                  ['<Up>'] = { 'select_prev', 'fallback' },
                  ['<Down>'] = { 'select_next', 'fallback' },
                  ['<C-k>'] = { 'select_prev', 'fallback' },
                  ['<C-j>'] = { 'select_next', 'fallback' },
              },
              sources = {
                  default = { 'lsp', 'path', 'snippets', 'buffer' },
              },
              fuzzy = { implementation = 'lua' },
          })
      end,
  }

  use('nvim-treesitter/nvim-treesitter', {run= ':TSUpdate'})

  use('mbbill/undotree')

  use 'ledger/vim-ledger'
end)

