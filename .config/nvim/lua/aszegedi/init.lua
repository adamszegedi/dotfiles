require("aszegedi.plugins")
require("aszegedi.remap") 
require("aszegedi.set")

-- Format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]


local function open_nvim_tree()
  require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
