vim.pack.add({
  { src = "https://github.com/neovim/nvim-lspconfig" },
  "https://github.com/mason-org/mason.nvim",
  -- Linting and formatting
  "https://github.com/mattn/efm-langserver",
  "https://github.com/creativenull/efmls-configs-nvim",
  -- Autocompletion
  "https://github.com/saghen/blink.lib",
  "https://github.com/saghen/blink.cmp",
  -- Snippets
  "https://github.com/L3MON4D3/LuaSnip",
  "https://github.com/rafamadriz/friendly-snippets"
})

require("mason").setup({})

vim.lsp.enable({
  "lua_ls",
  "luau-lsp",
  "marksman",
  "bashls",
  "efm"
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } }
    }
  }
})
vim.lsp.config("marksman", {})
vim.lsp.config("bashls", {})

local function lsp_on_attach(ev)
  local client = vim.lsp.get_client_by_id(ev.data.client_id)
  if not client then
    return
  end

  local bufnr = ev.buf
  local opts = { noremap = true, silent = true, buffer = bufnr }

  vim.keymap.set("n", "<leader>gd", function()
    require("telescope").builtin.lsp_definitions()
  end, opts)

  vim.keymap.set("n", "<leader>gD", vim.lsp.buf.definition, opts)

  vim.keymap.set("n", "<leader>gS", function()
    vim.cmd("vsplit")
    vim.lsp.buf.definition()
  end, opts)

  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

  vim.keymap.set("n", "<leader>D", function()
    vim.diagnostic.open_float({ scope = "line" })
  end, opts)
  vim.keymap.set("n", "<leader>d", function()
    vim.diagnostic.open_float({ scope = "cursor" })
  end, opts)
  vim.keymap.set("n", "<leader>nd", function()
    vim.diagnostic.jump({ count = 1 })
  end, opts)

  vim.keymap.set("n", "<leader>pd", function()
    vim.diagnostic.jump({ count = -1 })
  end, opts)

  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

  vim.keymap.set("n", "<leader>fr", function()
    require("telescope.builtin").lsp_references()
  end, opts)
  vim.keymap.set("n", "<leader>ft", function()
    require("telescope.builtin").lsp_type_definitions()
  end, opts)
  vim.keymap.set("n", "<leader>fs", function()
    require("telescope.builtin").lsp_document_symbols()
  end, opts)
  vim.keymap.set("n", "<leader>fw", function()
    require("telescope.builtin").lsp_workspace_symbols()
  end, opts)
  vim.keymap.set("n", "<leader>fi", function()
    require("telescope.builtin").lsp_implementations()
  end, opts)

  if client:supports_method("textDocument/codeAction", bufnr) then
    vim.keymap.set("n", "<leader>oi", function()
      vim.lsp.buf.code_action({
        context = { only = { "source.organizeImports" }, diagnostics = {} },
        apply = true,
        bufnr = bufnr,
      })
      vim.defer_fn(function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end, 50)
    end, opts)
  end
end

vim.api.nvim_create_autocmd("LspAttach", { group = augroup, callback = lsp_on_attach })

vim.keymap.set("n", "<leader>q", function()
  vim.diagnostic.setloclist({ open = true })
end, { desc = "Open diagnostic list" })
vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, { desc = "Show line diagnostics" })

-- Linting and formatting

local luacheck = require("efmls-configs.linters.luacheck")
local stylua = require("efmls-configs.formatters.stylua")

local prettier_d = require("efmls-configs.formatters.prettier_d")
local eslint_d = require("efmls-configs.linters.eslint_d")

local fixjson = require("efmls-configs.formatters.fixjson")

local shellcheck = require("efmls-configs.linters.shellcheck")
local shfmt = require("efmls-configs.formatters.shfmt")

vim.lsp.config("efm", {
  init_options = { documentFormatting = true },
  filetypes = {
    "sh",
    "html",
    "css",
    "lua",
    "json",
    "jsonc",
    "markdown"
  },
  settings = {
    languages = {
      sh = { shellcheck, shfmt },
      html = { prettier_d },
      css = { prettier_d },
      lua = { luacheck, stylua },
      json = { eslint_d, fixjson },
      jsonc = { eslint_d, fixjson },
      markdown = { prettier_d }
    }
  }
})

local lsp_fmt_group = vim.api.nvim_create_augroup('LspFormattingGroup', {})
vim.api.nvim_create_autocmd('BufWritePost', {
  group = lsp_fmt_group,
  callback = function(ev)
    local efm = vim.lsp.get_active_clients({ name = 'efm', bufnr = ev.buf })

    if vim.tbl_isempty(efm) then
      return
    end

    vim.lsp.buf.format({ name = 'efm' })
  end,
})

-- Autocompletion
local cmp = require('blink.cmp')

cmp.build():pwait()

cmp.setup({
  keymap = {
    preset = "none",
    ["<C-e>"] = { "show", "hide" },
    ["<CR>"] = { "accept", "fallback" },
    ["<C-j>"] = { "select_next", "fallback" },
    ["<C-k>"] = { "select_prev", "fallback" },
    ["<C-l>"] = { "snippet_forward", "fallback" },
    ["<C-h>"] = { "snippet_backward", "fallback" },
  },
  appearance = { nerd_font_variant = "mono" },
  signature = { enabled = true },
  sources = {
    default = { "lsp", "path", "snippets", "buffer" },
    providers = {
      snippets = { preset = "luasnip" }
    },
    -- just show lsp and snippets on markdown files
    per_filetype = {
      markdown = { inherit_defaults = false, "lsp", "snippets" }
    }
  },
  fuzzy = { implementation = "prefer_rust" },
})

vim.lsp.config["*"] = {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
}

require("luasnip.loaders.from_vscode").lazy_load()
