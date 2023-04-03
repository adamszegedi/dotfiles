local builtin = require('telescope.builtin')
local telescope = require('telescope')
local wk = require('which-key')

wk.register({
    f = {
    name = "file",
    f = {"<cmd>Telescope find_files<cr>", "Find File"},
    p = {builtin.git_files, "Find in Project"},
    g = {builtin.live_grep, "Grep Files"},
    b = {builtin.buffers, "Find in buffers"},
}, {prefix = "<leader>"}
})

