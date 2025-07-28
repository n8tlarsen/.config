return {
    {
        'Iron-E/nvim-highlite',
        opts = {generator = {plugins = {vim = false}}},
        config = function ()
            vim.cmd.colorscheme('highlite-tomorrow-night-eighties')
        end,
        lazy = false,
        priority = math.huge
    },
}
