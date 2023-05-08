local telescope = require('telescope')
local builtin = require('telescope.builtin')
local wk = require('which-key')

telescope.setup {
    defaults = { path_display = { shorten = { len = 2 } } }
}

wk.register({
        t = {
            name = "Telescope",
            f = { builtin.find_files, "Find File" },
            p = { builtin.git_files, "Find in Project" },
            g = { builtin.live_grep, "Grep Files" },
            b = { builtin.buffers, "Find in buffers" },
            i = { "<cmd>Telescope lsp_implementations<cr>", "Find Implementations" },
            r = { "<cmd>Telescope lsp_references<cr>", "Find References" }
        }
    },
    { prefix = "<leader>" }
)
