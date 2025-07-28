return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'master',
        lazy = false,
        build = ":TSUpdate",
        main = 'nvim-treesitter.configs',
        opts = {
            -- A list of parser names, or "all"
            ensure_installed = { "c", "cpp", "lua", "python", "json", "toml" },
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,
            -- Automatically install missing parsers when entering buffer
            auto_install = true,
            highlight = {
                -- `false` will disable the whole extension
                enable = true,
                disable = {"rust"},
                -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                -- Using this option may slow down your editor, and you may see some duplicate highlights.
                -- Instead of true it can also be a list of languages
                additional_vim_regex_highlighting = {"rust"},
            },
            indent = {
                enable = true,
                disable = {"rust", "cmake"},
            }
        },
    },
}

