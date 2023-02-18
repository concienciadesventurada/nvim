local builtin = require('telescope.builtin')
-- Find files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
-- Search in git repo
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- Search using grep
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
-- Search in help
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
