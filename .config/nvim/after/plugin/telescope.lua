local telescope = require('telescope')
local builtin = require('telescope.builtin')
local wk = require('which-key')

telescope.setup {
    defaults = { path_display = { shorten = { len = 5 } } }
}

wk.register({
        s = {
            b = { builtin.buffers, "[B]uffers" },
            c = { builtin.commands, "[C]ommands" },
            f = { builtin.find_files, "[F]ile" },
            g = { builtin.live_grep, "Live [G]rep" },
            k = { builtin.keymaps, "[K]eymaps" },
            h = { builtin.help_tags, "[H]elp" },
            p = { builtin.git_files, "[P]roject File" },
            r = { builtin.oldfiles, "[R]ecent files" },
            w = { builtin.grep_string, "Current [W]ord" },
        }
    },
    { prefix = "<leader>" }
)
