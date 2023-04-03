vim.g.mapleader = " "
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true })
vim.keymap.set("n", "<leader>h", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
vim.keymap.set("n", "<F3>", "<cmd>lua vim.lsp.buf.format()<CR>")
