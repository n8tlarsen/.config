vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")
vim.diagnostic.config({
    virtual_text = {
        severity = vim.diagnostic.severity.INFO,
    },
    signs = {
        priority = 100
    },
    severity_sort = true
})
vim.keymap.set("n", "<leader>y", function() vim.diagnostic.open_float({scope = "line"}) end)
vim.keymap.set("n", "<leader>d[", function() vim.diagnostic.goto_prev() end)
vim.keymap.set("n", "<leader>d]", function() vim.diagnostic.goto_next() end)

vim.opt.splitright = true
vim.cmd("ca vG vertical Git")
