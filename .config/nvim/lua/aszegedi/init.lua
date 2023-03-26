require("aszegedi.plugins")
require("aszegedi.remap") 
require("aszegedi.set")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 20
vim.g.liststyle = 3
-- Format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
