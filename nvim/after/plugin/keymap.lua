local nnoremap = require("user.keymap").nnoremap
local tnoremap = require("user.keymap").tnoremap

nnoremap("<leader>e", "<cmd>Ex<CR>")
nnoremap("<leader>f", "<cmd>Rg<CR>")
nnoremap("<leader>a", function() require("harpoon.mark").add_file() end, silent)
nnoremap("<leader>s", function() require("harpoon.ui").toggle_quick_menu() end, silent)
nnoremap("<leader>j", function() require("harpoon.ui").nav_file(1) end, silent)
nnoremap("<leader>k", function() require("harpoon.ui").nav_file(2) end, silent)
nnoremap("<leader>l", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<leader>;", function() require("harpoon.ui").nav_file(4) end, silent)
tnoremap("<Esc>", "<C-\\><C-n>")
