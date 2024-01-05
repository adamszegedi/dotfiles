return {
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'L3MON4D3/LuaSnip'},
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    {'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {}},
    { 'numToStr/Comment.nvim', opts = {} },
    {
     'nvim-treesitter/nvim-treesitter',
      dependencies = {
          'nvim-treesitter/nvim-treesitter-textobjects',
        },
      build = ':TSUpdate',
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {'nvim-lualine/lualine.nvim',},
    {"akinsho/bufferline.nvim"},
    {"nvim-tree/nvim-tree.lua"},
    {"nvim-tree/nvim-web-devicons"},
    {"folke/which-key.nvim", opts = {}},
    {'navarasu/onedark.nvim'},
}
