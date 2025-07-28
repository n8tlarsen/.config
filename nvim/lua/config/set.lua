vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.colorcolumn = '101'
vim.opt.scrolloff = 16
vim.opt.wrap = false
vim.opt.clipboard = unnamedplus
vim.opt.termguicolors = true
vim.opt.conceallevel = 1

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.g.mapleader = " "

vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")

vim.opt.splitright = true
vim.cmd("ca vG vertical Git")

vim.keymap.set("n","<leader>e","<cmd>Ex<CR>")
vim.keymap.set("n","<leader> ","<cmd>b#<CR>")
vim.keymap.set("t","<Esc>","<C-\\><C-n>")
vim.keymap.set("v","P",'"_dP')
vim.keymap.set("n", "d;", "<cmd>keepp.s/\\s\\+$//e<CR>")

vim.g.DoxygenToolkit_startCommentTag   = "/***********************************************************************************************//**"
vim.g.DoxygenToolkit_startCommentBlock = "/*"
vim.g.DoxygenToolkit_interCommentTag   = " * "
vim.g.DoxygenToolkit_interCommentBlock = " * "
vim.g.DoxygenToolkit_endCommentTag     = " **************************************************************************************************/"
vim.g.DoxygenToolkit_endCommentBlock   = "*/"
vim.g.DoxygenToolkit_authorName  = "Nathan Larsen" 
