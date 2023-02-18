require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = true,
    show_end_of_buffer = false, -- show the '~' characters after the end of buffers
    term_colors = false,
    dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    color_overrides = {},
    custom_highlights = {},
    integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = false,
        telescope = true,
        notify = false,
        mini = false,
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"


-- ######### VSCODE #########
-- Lua:
-- For dark theme (neovim's default)
--vim.o.background = 'dark'
--
--local c = require('vscode.colors').get_colors()
--require('vscode').setup({
--    -- Enable transparent background
--    transparent = true,
--
--    -- Enable italic comment
--    italic_comments = true,
--
--    -- Disable nvim-tree background color
--    disable_nvimtree_bg = true,
--
--    -- Override colors (see ./lua/vscode/colors.lua)
--    color_overrides = {
--        vscLineNumber = '#FFFFFF',
--    },
--
--    -- Override highlight groups (see ./lua/vscode/theme.lua)
--    group_overrides = {
--        -- this supports the same val table as vim.api.nvim_set_hl
--        -- use colors from this colorscheme by requiring vscode.colors!
--        Cursor = { fg=c.vscDarkBlue, bg=c.vscLightGreen, bold=true },
--    }
--})
