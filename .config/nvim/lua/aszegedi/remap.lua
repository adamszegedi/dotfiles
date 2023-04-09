local wk = require("which-key")

vim.keymap.set("n", "<F3>", "<cmd>lua vim.lsp.buf.format()<CR>")
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous Diagnostic" })
--Move lines with alt keys
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line up" })       -- move line up(n)
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line down" })     -- move line down(n)
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line up" })   -- move line up(v)
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line down" }) -- move line down(v)

wk.register({
    b = {
        name = "Buffer",
        c = { "<Cmd>bd!<Cr>", "Close current buffer" },
        n = { "<Cmd>bnext<Cr>", "Next Buffer" },
        p = { "<Cmd>bprevious<Cr>", "Previous Buffer" },
        D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all buffers" },
    }
}, { prefix = "<leader>" })

wk.register({ c = { name = "Nerd Commenter" } }, { prefix = "<leader>" })

-- NvimTree
wk.register({ e = { "<cmd>NvimTreeToggle<cr>", "NvimTreeToggle" } }, { prefix = "<leader>" })

-- Diagnostic keymaps
wk.register({
        l = {
            name = "LSP",
            f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format buffer" },
            o = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Open float" },
            q = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "Set loclist" },
        }
    },
    { prefix = "<leader>" }
)
