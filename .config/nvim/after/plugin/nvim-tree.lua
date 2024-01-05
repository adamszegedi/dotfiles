local wk = require("which-key")
require("nvim-tree").setup()

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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
wk.register({
    t = {
        name = "Nvim[T]ree",
        t = { "<cmd>NvimTreeToggle<cr>", "[T]oggle" },
        f = { "<cmd>NvimTreeFindFile<cr>", "Locate [F]ile" },
    },
    prefix = "<leader>"
}
)
