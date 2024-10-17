local wk = require("which-key")

vim.keymap.set("n", "]b", "<Cmd>bnext<Cr>", { desc = "next buffer" })
vim.keymap.set("n", "[b", "<Cmd>bprevious<Cr>", { desc = "previous buffer" })
--Move lines with alt keys
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line up" })       -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line down" })     -- move line down(n)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line up" })   -- move line up(v)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line down" }) -- move line down(v)

wk.add({
    { "<leader>bc", "<Cmd>bd!|bnext<Cr>",  desc = "[C]lose current buffer" },
    { "<leader>bd", "<Cmd>%bd|e#|bd#<Cr>", desc = "[D]elete all buffers" },
    { "<leader>bn", "<Cmd>enew<Cr>",       desc = "[N]ew buffer" },
})
