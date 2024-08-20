local harpoon = require 'harpoon'

local function set_keymap()
    vim.keymap.set("n", "<leader>a", harpoon.mark.add_file)
    vim.keymap.set("n", "<C-s>", harpoon.ui.toggle_quick_menu)

    vim.keymap.set("n", "<C-n>", function() harpoon.ui.nav_file(1) end)
    vim.keymap.set("n", "<C-e>", function() harpoon.ui.nav_file(2) end)
    vim.keymap.set("n", "<C-i>", function() harpoon.ui.nav_file(3) end)
    vim.keymap.set("n", "<C-o>", function() harpoon.ui.nav_file(4) end)
end

local function init()
	set_keymap()
end

return {
	init = init,
}
