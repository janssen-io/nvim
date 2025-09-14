local lazy = require 'lazydev'

lazy.setup({
      ft = 'lua',
      opts = {
          library = {
              { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
      },
  })
