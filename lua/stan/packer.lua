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
      -- ft = { 'go', 'godoc', 'gomod' },
      requires = {
          'neovim/nvim-lspconfig',
          'mason-org/mason-lspconfig.nvim',
      },
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
  }

  use('nvim-treesitter/nvim-treesitter', {run= ':TSUpdate'})

  use('mbbill/undotree')

  use 'ledger/vim-ledger'
end)

