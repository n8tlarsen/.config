require("user.set")
require("lazy").setup({
    'nvim-lua/plenary.nvim',
    'neovim/nvim-lspconfig',
    {
        'nvim-treesitter/nvim-treesitter',
        build = function() require("nvim-treesitter.install").update({ with_sync = true })() end,
    },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/nvim-cmp',
    {'L3MON4D3/LuaSnip', tag = 'v2.0.0', build = 'make install_jsregexp'},
    'saadparwaiz1/cmp_luasnip',
    'simrat39/rust-tools.nvim',
    'rust-lang/rust.vim',
    {'junegunn/fzf', rtp = "plugin"},
    'junegunn/fzf.vim',
    'ThePrimeagen/harpoon',
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true}
    },
    'airblade/vim-gitgutter',
    {'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {}},
    'vim-scripts/DoxygenToolkit.vim',
    'tpope/vim-commentary',
    'tpope/vim-fugitive',
    {
	    "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },
    {
        'chriskempson/tomorrow-theme',
        config = function(plugin) vim.opt.rtp:append(plugin.dir .. "/vim") end,
    },
})
