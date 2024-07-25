return {
    { 'folke/neodev.nvim' },
    { 'j-hui/fidget.nvim',                   opts = {} },
    { 'VonHeikemen/lsp-zero.nvim',           branch = 'v3.x' },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'L3MON4D3/LuaSnip' },
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl',   opts = {} },
    { 'numToStr/Comment.nvim',               opts = {} },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-lualine/lualine.nvim', },
    { "akinsho/bufferline.nvim" },
    { "nvim-tree/nvim-web-devicons",            enabled = vim.g.have_nerd_font },
    { "folke/which-key.nvim",                   opts = {} },
    { 'navarasu/onedark.nvim' },
}
