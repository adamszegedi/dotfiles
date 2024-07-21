local telescope = require('telescope')
local builtin = require('telescope.builtin')
local wk = require('which-key')

telescope.setup {
    defaults = { path_display = { shorten = { len = 5 } } }
}

wk.add({
    { "<leader>sb", builtin.buffers,     desc = "[B]uffers" },
    { "<leader>sc", builtin.commands,    desc = "[C]ommands" },
    { "<leader>sf", builtin.find_files,  desc = "[F]ile" },
    { "<leader>sg", builtin.live_grep,   desc = "Live [G]rep" },
    { "<leader>sh", builtin.help_tags,   desc = "[H]elp" },
    { "<leader>sk", builtin.keymaps,     desc = "[K]eymaps" },
    { "<leader>sp", builtin.git_files,   desc = "[P]roject File" },
    { "<leader>sr", builtin.oldfiles,    desc = "[R]ecent files" },
    { "<leader>sw", builtin.grep_string, desc = "Current [W]ord" },
})
