-- vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir'
vim.opt.undodir = os.getenv('AppData') .. '/Local/nvim-data/undodir'
vim.opt.undofile = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 12
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"
vim.opt.cursorline = true

vim.g.terminal_emulator='powershell'
vim.opt.shell='cmd.exe'
vim.opt.shellcmdflag="/c powershell.exe -NoLogo -NoProfile -NonInteractive -ExecutionPolicy RemoteSigned"
vim.opt.shellpipe='|'
vim.opt.shellredir='>'
