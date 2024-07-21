local wk = require("which-key")

vim.keymap.set("n", "]b", "<Cmd>bnext<Cr>", { desc = "next buffer" })
vim.keymap.set("n", "[b", "<Cmd>bprevious<Cr>", { desc = "previous buffer" })
--Move lines with alt keys
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line up" })       -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line down" })     -- move line down(n)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line up" })   -- move line up(v)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line down" }) -- move line down(v)

--Move focus between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

wk.add({
    { "<leader>b",  group = "[B]uffer" },
    { "<leader>bc", "<Cmd>bd!|bnext<Cr>",  desc = "[C]lose current buffer" },
    { "<leader>bd", "<Cmd>%bd|e#|bd#<Cr>", desc = "[D]elete all buffers" },
    { "<leader>bn", "<Cmd>enew<Cr>",       desc = "[N]ew buffer" },
})
