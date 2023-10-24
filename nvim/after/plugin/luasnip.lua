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
