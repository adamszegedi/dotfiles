require("lazy").setup(
  {
    { 'j-hui/fidget.nvim',                   opts = {} },
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/cmp-buffer' },
    { 'hrsh7th/cmp-path' },
    { 'hrsh7th/cmp-cmdline' },
    { 'hrsh7th/nvim-cmp' },
    { 'hrsh7th/vim-vsnip' },
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl',   opts = {} },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    { 'nvim-telescope/telescope-ui-select.nvim' },
    { 'nvim-lualine/lualine.nvim', },
    { "folke/which-key.nvim",                   opts = {} },

    { 'navarasu/onedark.nvim' },
    { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true, opts = ...},
    { "shaunsingh/nord.nvim", priority = 1000,}
  }
);
