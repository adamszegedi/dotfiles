local builtin = require('telescope.builtin')
local wk = require('which-key')

wk.register({
        f = {
            name = "Telescope",
            f = { "<cmd>Telescope find_files<cr>", "Find File" },
            p = { builtin.git_files, "Find in Project" },
            g = { builtin.live_grep, "Grep Files" },
            b = { builtin.buffers, "Find in buffers" },
            i = { "<cmd>Telescope lsp_implementations<cr>", "Find Implementations" },
            r = { "<cmd>Telescope lsp_references<cr>", "Find References" }
        }
    },
    { prefix = "<leader>" }
)
