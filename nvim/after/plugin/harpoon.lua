local harpoon = require("harpoon")
harpoon:setup({
    term = {
        settings = {
            save_on_toggle = false,
            select_with_nil = false,
            sync_on_ui_close = false,
        },
    },
})

---@type HarpoonList
local term_list = harpoon:list("term")

---@return string name of the created terminal
local function create_terminal()
	vim.cmd("terminal")
	local buf_id = vim.api.nvim_get_current_buf()
	return vim.api.nvim_buf_get_name(buf_id)
end

---@param index number: The index of the terminal to select.
local function select_term(index)
    if index > term_list:length() then
        create_terminal()
        print("Creating terminal", index)
        -- just append the newly open terminal
        term_list:add()
    else
        -- find in list
        print("selecting terminal", index)
        term_list:select(index)
    end
end

-- TODO this wont work when term gets deleted by telescope
local function remove_closed_terms()
	for _, term in ipairs(term_list.items) do
		local bufnr = vim.fn.bufnr(term.value)
		if bufnr == -1 then
			print("Removing:" .. term.value)
			term_list:remove(term)
		end
		-- can get id here with nvim_buf_get_name because buffer is already deleted
		--term_list:remove(term_name)
		--
	end
end

-- Autocommand to remove closed terminal from the list

-- "VimEnter" cleans terminals that were saved when you closed vim for the last time but were not removed
vim.api.nvim_create_autocmd({ "TermClose", "VimEnter" }, {
	pattern = "*",
	callback = remove_closed_terms,
})

-- This is needed because closing term with bd! won't trigger "TermClose"
vim.api.nvim_create_autocmd({ "BufDelete", "BufUnload" }, {
	pattern = "term://*",
	callback = remove_closed_terms,
})

-- Command that I use for debugging
vim.api.nvim_create_user_command("HarpoonShowTermList", function()
	harpoon.ui:toggle_quick_menu(term_list)
end, {})

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<leader>s", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
vim.keymap.set("n", "<leader>j", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>k", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>l", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>;", function() harpoon:list():select(4) end)
vim.keymap.set("n", "gt", function() select_term(1) end)
