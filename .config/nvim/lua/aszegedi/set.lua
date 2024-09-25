vim.scriptencoding = "utf-8"
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

vim.opt.number = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = "a"

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false
-- Sets the character encoding used inside Vim.
vim.opt.encoding = "utf-8" 
-- Sets the character encoding for the file buffer
vim.opt.fileencoding = "utf-8" 

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.relativenumber = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
local undodir = (os.getenv("HOME") or os.getenv("UserProfile")) .. "/.vim/undodir"
vim.opt.undodir = undodir

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.scrolloff = 5
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.laststatus = 3
vim.opt.updatetime = 50
vim.opt.colorcolumn = "120"
vim.opt.termguicolors = true

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
