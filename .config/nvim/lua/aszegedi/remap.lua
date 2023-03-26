vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Lex)
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==") -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==") -- move line down(n)
