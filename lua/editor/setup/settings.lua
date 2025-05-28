vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.o.backspace = 'indent,eol,start'

vim.o.number = true
vim.o.foldlevel = 99
vim.o.foldlevelstart = 99
vim.o.foldenable = true

vim.opt.laststatus = 2

vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.mouse = 'a'

vim.opt.wrap = false

vim.g.mapleader = ' '

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.syntax = 'on'

vim.opt.scrolloff = 8
vim.opt.updatetime = 50
vim.opt.cursorline = false
vim.opt.showmode = false
vim.opt.clipboard = "unnamedplus"

-- Python
vim.g.python3_host_prog = "~/.local/mambaforge/bin/python3"
vim.g.python2_host_prog = "/usr/bin/python2.7"
vim.g.ruby_host_prog    = "/usr/bin/ruby"
vim.g.perl_host_prog    = "/usr/bin/perl"

vim.api.nvim_create_autocmd(
  {
    "BufNewFile",
    "BufRead",
  },
  {
    pattern = "*.tex",
    callback = function()
        vim.opt.filetype = "tex"
        vim.opt.wrap = true
        vim.opt.linebreak = true
    end
  }
)

-- Comment adjustment (block comments look bad in vim-commentary)
vim.api.nvim_create_autocmd("FileType", { pattern = { "c", "cpp", "cs", "java" }, command = 'setlocal commentstring=//%s'})
