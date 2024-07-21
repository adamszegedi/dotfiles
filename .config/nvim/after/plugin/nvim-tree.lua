local wk = require("which-key")
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("nvim-tree").setup({
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        custom = {
            "^.git$",
        },
    },
})

local function open_nvim_tree(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
        return
    end

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

-- NvimTree
wk.add({
    { "<leader>tt", "<cmd>NvimTreeToggle<cr>", desc = "[T]ree" },
})
