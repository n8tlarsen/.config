return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
        opts = {
            options = {
                theme = 'auto',
            },
            sections = {
                lualine_b = {
                    'branch',
                    'diff',
                    {
                        'diagnostics',
                        sources = { 'nvim_lsp' },
                        diagnostics_color = {
                            error = {fg = '#e32636'},
                            warn  = {fg = '#ffa500'},
                            info  = {fg = '#ffffff'},
                            hint  = {fg = '#273faf'},
                        },
                    }
                }
            }
        },
    },
}
