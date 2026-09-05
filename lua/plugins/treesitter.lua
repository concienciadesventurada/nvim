vim.pack.add({
    {
        src = "https://github.com/nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate"
    }
})

require("nvim-treesitter").setup {
    -- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
    install_dir = vim.fn.stdpath('data') .. '/site'
}

require("nvim-treesitter").install {
    "lua",
    "bash",
    "markdown",
    "json"
}
