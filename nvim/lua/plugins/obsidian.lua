return {
    {
        "epwalsh/obsidian.nvim",
        version = "*",  -- recommended, use latest release instead of latest commit
        lazy = true,
        event = {
          -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
          -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
          -- refer to `:h file-pattern` for more examples
          "BufEnter " .. vim.fn.expand "~" .. "/notes/*",
        },
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            workspaces = {
                {
                    name = "nathan",
                    path = "~/notes/nathan",
                },
            },
        },
    }
}
