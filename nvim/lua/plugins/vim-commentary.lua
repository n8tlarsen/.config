return {
    'tpope/vim-commentary',
    config = function ()
        vim.api.nvim_create_autocmd("FileType", {pattern = "vhdl", command = "setlocal commentstring=--%s"})
    end
}
