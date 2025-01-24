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
    'junegunn/vim-easy-align',
    {'nvim-telescope/telescope.nvim', branch = '0.1.x'},
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release &&\
        cmake --build build --config Release && cmake --install build --prefix build'
    },
    'dhruvasagar/vim-table-mode',
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true}
    },
    'airblade/vim-gitgutter',
    {'lukas-reineke/indent-blankline.nvim', main = 'ibl', opts = {}},
    'vim-scripts/DoxygenToolkit.vim',
    'tpope/vim-commentary',
    'tpope/vim-fugitive',
    'tpope/vim-surround',
    {
	    "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    },

    {
        'chriskempson/tomorrow-theme',
        config = function(plugin) vim.opt.rtp:append(plugin.dir .. "/vim") end,
    },
    {
        'Iron-E/nvim-highlite',
        config = function(_, opts)
            -- OPTIONAL: setup the plugin. See "Configuration" for information
            require('highlite').setup {generator = {plugins = {vim = false}}}
            
            vim.cmd.colorscheme('highlite-tomorrow-night-eighties')
            -- or one of the alternate colorschemes (see the "Built-in Colorschemes" section)
            -- vim.api.nvim_command 'colorscheme highlite'
        end,
        lazy = false,
        priority = math.huge
    },
    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        lazy = true,
        event = {
          -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
          -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
          -- refer to `:h file-pattern` for more examples
          "BufReadPre " .. vim.fn.expand "~" .. "/vaults/*.md",
          "BufNewFile " .. vim.fn.expand "~" .. "/vaults/*.md",
        },
        opts = {
            workspaces = {
                {
                    name = "personal",
                    path = "~/vaults/personal",
                },
                {
                    name = "work",
                    path = "~/vaults/work",
                },
            },
        },
    }
})
