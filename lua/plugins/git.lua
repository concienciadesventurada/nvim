vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/f-person/git-blame.nvim"
})

require("gitblame").setup({
  enabled = false,
  vim.keymap.set("n", "<leader>gb", "<cmd>GitBlameToggle<CR>")
})

require("gitsigns").setup()
