local lspconfig = require('lspconfig')
local configs = require('lspconfig.configs')

if not configs.rust_hdl then
    configs["rust_hdl"] = {
        default_config = {
            cmd = {'vhdl_ls'},
            filetypes = { "vhdl" },
            root_dir = lspconfig.util.root_pattern('vhdl_ls.toml'),
            settings = {},
        };
    }
end
lspconfig.rust_hdl.setup{
    on_attach=on_attach
}

vim.api.nvim_create_autocmd("FileType", {pattern = "vhdl", command = "setlocal commentstring=--%s"})
