return {
  'nvim-lualine/lualine.nvim',
  'mattn/emmet-vim',
  'windwp/nvim-autopairs',
  'norcalli/nvim-colorizer.lua',
  'lukas-reineke/indent-blankline.nvim',
  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',
  'folke/todo-comments.nvim',
  'Mofiqul/vscode.nvim',
  'catppuccin/nvim',
  'mbbill/undotree',
  'tpope/vim-fugitive',
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  {
    "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
    }
  }
}
