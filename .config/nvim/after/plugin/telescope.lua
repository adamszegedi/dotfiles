local telescope = require('telescope')
local builtin = require('telescope.builtin')
local wk = require('which-key')

telescope.setup {
    defaults = { path_display = { shorten = { len = 5 } } }
}

wk.register({
        s= {
            name = "[S]earch",
            f = { builtin.find_files, "[F]ile" },
            p = { builtin.git_files, "[P]roject File" },
            g = { builtin.live_grep, "Live [Grep]" },
            b = { builtin.buffers, "[B]uffers" },
            h = { builtin.help_tags, "[H]elp" },
            w = { builtin.grep_string, "Current [W]ord" },
            d = { builtin.diagnostics, "[D]iagnostics" },
            r = { builtin.oldfiles, "[R]ecent files" },
        }
    },
    { prefix = "<leader>" }
)
