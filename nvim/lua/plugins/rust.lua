return {
    {
        'mrcjkb/rustaceanvim',
        version = '^6', -- Recommended
        lazy = false, -- This plugin is already lazy
        ft = "rust",
        config = function ()
            local cfg = require('rustaceanvim.config')
            local home = os.getenv("HOME")
            local codelldb_path = home .. '/codelldb/extension/adapter/codelldb'
            local liblldb_path  = home .. '/codelldb/extension/lldb/lib/liblldb.so'
            vim.g.rustaceanvim  = {
                dap = {
                    adapter = cfg.get_codelldb_adapter(codelldb_path, liblldb_path)
                }
            }
        end,
    },
    {
        'rust-lang/rust.vim',
        ft = "rust",
        init = function ()
            vim.g.rustfmt_autosave = 1
        end
    },
}

