return {
    {
        'L3MON4D3/LuaSnip',
        tag = 'v2.0.0', 
        build = 'make install_jsregexp',
        dependencies = {
            'hrsh7th/nvim-cmp',
            'saadparwaiz1/cmp_luasnip',
        },
        config = function ()
            local ls = require("luasnip")
            local snip = ls.snippet
            local text = ls.text_node
            local insert = ls.insert_node
            ls.add_snippets(nil, {
                all = {
                    snip({
                        trig = "//=",
                        namr = "Comment Title",
                        dscr = "Comment title block"
                    }, {
                            text({
                                "//==============================================================================",
                                "// "}), insert(1, ""), text({"",
                                "//==============================================================================",
                                "",
                            }), insert(0)
                        }),
                },
            })
            require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })
        end
    },
}

