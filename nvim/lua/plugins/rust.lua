return {
    {
        'simrat39/rust-tools.nvim',
        opts = {
            server = {
                on_attach = function(_, bufnr)
                    -- Hover actions
                    vim.keymap.set("n", "<Leader>h", require('rust-tools').hover_actions.hover_actions, { buffer = bufnr })
                    -- Code action groups
                    vim.keymap.set("n", "<Leader>c", require('rust-tools').code_action_group.code_action_group, { buffer = bufnr })
                end,
            },
        }
    },
    'rust-lang/rust.vim',
}

