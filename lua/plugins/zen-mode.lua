vim.pack.add({
  "https://github.com/folke/zen-mode.nvim"
})

require("zen-mode").setup({
  window = {
    width = 80,
    height = 0.8,
    options = {
      signcolumn = "no",
      number = false,
      relativenumber = false
    }
  }
})

vim.keymap.set("n", "<leader>z", function()
  require("zen-mode").toggle()
end)
