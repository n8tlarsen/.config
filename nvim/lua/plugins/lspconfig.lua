return {
    'neovim/nvim-lspconfig',
    depenencies = {
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
        -- Set up lspconfig and completion with cmp
        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        lspconfig['rust_analyzer'].setup({
            on_attach = on_attach,
            capabilities = capabilities
        })
        lspconfig['clangd'].setup({
            on_attach = on_attach,
            capabilities = capabilities
        })
        lspconfig['vhdl_ls'].setup({
            on_attach = on_attach,
            capabilities = capabilities
        })
        -- Diagnostic config
        vim.diagnostic.config({
            virtual_text = {
                severity = vim.diagnostic.severity.INFO,
            },
            signs = {
                severity = vim.diagnostic.severity.ERROR,
            },
            severity_sort = true
        })
        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set("n", "<leader>y", function() vim.diagnostic.open_float({scope = "line"}) end)
        vim.keymap.set('n', '[d', function () 
            vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR}) 
        end)
        vim.keymap.set('n', '[D', function () vim.diagnostic.goto_prev() end)
        vim.keymap.set('n', ']d', function () 
            vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})
        end)
        vim.keymap.set('n', ']D', function () vim.diagnostic.goto_next() end)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                vim.keymap.set('n', 'gD',         vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gd',         vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K',          vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi',         vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>',      vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
                vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
                vim.keymap.set('n', '<leader>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                vim.keymap.set('n', '<leader>D',  vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', '<>rn',       vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('v', '<leader>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', 'gr',         vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<leader>f',  function()
                    vim.lsp.buf.format { async = true }
                end, opts)
            end,
        })
    end
}

