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
    { "<leader>n", desc = "[N]eovim" },
    { "<leader>g", desc = "[G]it" },
})

wk.add({
    { "<leader>gf",       builtin.git_files,        desc = "Telescope Project [F]ile" },
    { "<leader>gc",       builtin.git_commits,      desc = "Telescope Project [C]ommits" },
    { "<leader>gb",       builtin.git_bcommits,     desc = "Telescope Project [B]ranches" },
    { "<leader>gs",       builtin.git_status,       desc = "Telescope Project [S]tatus" },
    { "<leader>gt",       builtin.git_stash,        desc = "Telescope Project s[T]ash" },
    { "<leader>g/",       builtin.git_bcommits,     desc = "Telescope Buffer Commits" },
    { "<leader>nh",       builtin.help_tags,        desc = "Telescope [H]elp" },
    { "<leader>nk",       builtin.keymaps,          desc = "Telescope [K]eymaps" },
    { "<leader>nc",       builtin.commands,         desc = "Telescope [C]ommands" },
    { "<leader>sf",       builtin.find_files,       desc = "Telescope [F]ile" },
    { "<leader>sg",       builtin.live_grep,        desc = "Telescope Live [G]rep" },
    { "<leader>sr",       builtin.resume,           desc = "Telescope [R]esume" },
    { "<leader>sw",       builtin.grep_string,      desc = "Telescope Current [W]ord" },
    { "<leader><leader>", builtin.buffers,          desc = "Telescope [ ] Find existing buffers" },
    { "<leader>s.",       builtin.oldfiles,         desc = "Telescope [O]ld files" },
})
 
-- Slightly advanced example of overriding default behavior and theme
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 20,
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
vim.keymap.set('n', '<leader>nn', function()
    builtin.find_files { cwd = vim.fn.stdpath 'config' }
end, { desc = '[S]earch [N]eovim files' })
