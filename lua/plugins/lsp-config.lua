return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            local util = require("lspconfig/util")

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.tsserver.setup({
                capabilities = capabilities,
            })
            lspconfig.svelte.setup({
                capabilities = capabilities,
            })
            lspconfig.bashls.setup({
                capabilities = capabilities,
            })
            lspconfig.tailwindcss.setup({
                capabilities = capabilities,
            })
            lspconfig.html.setup({
                capabilities = capabilities,
            })
            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
                filetypes = { "rust" },
                root_dir = util.root_pattern("Cargo.toml"),
                settings = {
                    ["rust_analyzer"] = {
                        allFeatures = true
                    }
                }
            })
            lspconfig.gopls.setup({
                capabilities = capabilities,
                cmd = { "gopls" },
                filetypes = { "go", "gomod", "gowork", "gotmpl" },
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        analyses = {
                            unusedParameters = true
                        }
                    }
                },
                root_dir = util.root_pattern("go.work", "go.mod", ".git")
            })

            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
            vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, {})
            vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, {})
            vim.keymap.set("n", "<space>wl", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, {})
            vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, {})
            vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, {})
            vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<space>f", function()
                vim.lsp.buf.format({ async = true })
            end, {})

            vim.keymap.set(
                "n",
                "<leader>tt",
                ":lua vim.diagnostic.config({ virtual_text = false })<CR>",
                { noremap = true }
            )
            vim.keymap.set(
                "n",
                "<leader>tr",
                ":lua vim.diagnostic.config({ virtual_text = true })<CR>",
                { noremap = true }
            )
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "svelte", "tsserver", "tailwindcss", "html", "bashls", "rust_analyzer", "gopls" },
            })
        end,
    },
    {
        "rust-lang/rust.vim",
        ft = "rust",
        init = function()
            vim.g.rustfmt_autosave = 1
        end
    }
}
