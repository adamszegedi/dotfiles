local telescope = require('telescope')
local builtin = require('telescope.builtin')
local wk = require('which-key')

telescope.setup {
    defaults = {
        path_display = { shorten = { len = 5, exclude = { 1, -1 }, truncate = true } },
        dynamic_preview_title = true
    },
    extensions = {
        ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
        },
    },
}

pcall(require('telescope').load_extension, 'fzf')
pcall(require('telescope').load_extension, 'ui-select')

wk.add({
    { "<leader>sb",       builtin.buffers,     desc = "[B]uffers" },
    { "<leader>sd",       builtin.diagnostic,  desc = "[D]iagnostic" },
    { "<leader>sc",       builtin.commands,    desc = "[C]ommands" },
    { "<leader>sf",       builtin.find_files,  desc = "[F]ile" },
    { "<leader>sg",       builtin.live_grep,   desc = "Live [G]rep" },
    { "<leader>sh",       builtin.help_tags,   desc = "[H]elp" },
    { "<leader>sk",       builtin.keymaps,     desc = "[K]eymaps" },
    { "<leader>sp",       builtin.git_files,   desc = "[P]roject File" },
    { "<leader>s.",       builtin.oldfiles,    desc = "[O]ld files" },
    { "<leader>sw",       builtin.grep_string, desc = "Current [W]ord" },
    { "<leader>sr",       builtin.resume,      desc = "[R]esume" },
    { "<leader><leader>", builtin.buffers,     desc = "[ ] Find existing buffers" },
})

-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

-- It's also possible to pass additional configuration options.
--  See `:help telescope.builtin.live_grep()` for information about particular keys
vim.keymap.set('n', '<leader>s/', function()
    builtin.live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
    }
end, { desc = '[S]earch [/] in Open Files' })

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>sn', function()
    builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })
