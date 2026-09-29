return {
    {
        "obsidian-nvim/obsidian.nvim",
        version = "*", -- use latest release, remove to use latest commit
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
            legacy_commands = false, -- this will be removed in 4.0.0
            workspaces = {
                {
                    name = "nathan",
                    path = "~/notes/nathan",
                },
            },
        },
        keys = {
            {
                '<leader>fn',
                function ()
                    require("obsidian.commands.search")({ args = "" })
                end,
                desc = "Obsidian: search notes"
            }
        }
    }
}
