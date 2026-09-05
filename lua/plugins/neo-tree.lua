vim.pack.add({
  {
    src = 'https://github.com/nvim-neo-tree/neo-tree.nvim',
    version = vim.version.range('3')
  },
  -- dependencies
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  -- optional, but recommended
  "https://github.com/nvim-tree/nvim-web-devicons",
})

require("neo-tree").setup({
    window = {
        width = 35,
    },
    hijack_netrw_behavior = "open_default",
    event_handlers = {
        {
            event = "file_opened",
            handler = function()
                require("neo-tree.command").execute({ action = "close" })
            end,
        },
    },
})

vim.keymap.set("n", "<leader>e", ":Neotree toggle filesystem reveal<CR>", {})
