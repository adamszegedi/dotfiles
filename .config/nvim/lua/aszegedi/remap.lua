local wk = require("which-key")

vim.keymap.set("n", "<F3>", "<cmd>lua vim.lsp.buf.format()<CR>")
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "next diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "previous diagnostic" })
vim.keymap.set("n", "]b", "<Cmd>bnext<Cr>", { desc = "next buffer" })
vim.keymap.set("n", "[b", "<Cmd>bprevious<Cr>", { desc = "previous buffer" })
--Move lines with alt keys
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line up" })       -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line down" })     -- move line down(n)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line up" })   -- move line up(v)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line down" }) -- move line down(v)


wk.register({
    b = {
        name = "Buffer",
        x = { "<Cmd>bd!|bnext<Cr>", "Close current buffer" },
        n = { "<Cmd>bnext<Cr>", "Next Buffer" },
        p = { "<Cmd>bprevious<Cr>", "Previous Buffer" },
        D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
    }
}, { prefix = "<leader>" })


-- Diagnostic keymaps
wk.register(
    {
        l = {
            name = "LSP",
            f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format buffer" },
            o = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open float" },
            c = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
            q = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Set loclist" },
        }
    }, { prefix = "<leader>" }
)
