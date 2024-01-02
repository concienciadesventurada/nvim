return {
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			enable = true,
			line_numbers = true,
			max_lines = 10,
		},
	},
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")

		config.setup({
			ensure_installed = { "lua", "javascript", "c", "svelte", "bash", "css", "html", "typescript", "markdown" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
