-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'neovim/nvim-lspconfig'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    use 'simrat39/rust-tools.nvim'
    use 'rust-lang/rust.vim'
    use {'junegunn/fzf', rtp = "plugin"}
    use 'junegunn/fzf.vim'
    use 'ThePrimeagen/harpoon'
    use 'vim-airline/vim-airline'
    use 'vim-airline/vim-airline-themes'
    use 'airblade/vim-gitgutter'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'vim-scripts/DoxygenToolkit.vim'
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'
    use {
	    "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use {'chriskempson/tomorrow-theme', rtp = "vim"}
end)
