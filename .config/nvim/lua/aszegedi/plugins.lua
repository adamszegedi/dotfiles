require("lazy").setup(
  {
    { 'folke/neodev.nvim' },
    { 'j-hui/fidget.nvim',                   opts = {} },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim',           branch = 'v3.x' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'L3MON4D3/LuaSnip' },
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl',   opts = {} },
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
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...}
  }
);
