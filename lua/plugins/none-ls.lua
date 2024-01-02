return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier.with({
					extra_filetypes = { "svelte" },
				}),
				null_ls.builtins.formatting.beautysh,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.diagnostics.jsonlint,
				null_ls.builtins.diagnostics.markdownlint,
				-- null_ls.builtins.diagnostics.rustywind,
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
