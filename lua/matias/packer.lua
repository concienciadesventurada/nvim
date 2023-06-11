local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false

end

local packer_bootstrap = ensure_packer()

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    -- or                            , branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
  }

  use { 'nvim-treesitter/nvim-treesitter-context'}

  -- VSCode theme 'cause its the most intuitive colorscheme
  use ('Mofiqul/vscode.nvim')

  -- Catpuccin themes
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Persistant marks to different projects
  --use ('theprimeagen/harpoon')

  -- Keeps records of all changes
  use ('mbbill/undotree')

  -- Git integration
  use ('tpope/vim-fugitive')

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v1.x',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {'williamboman/mason.nvim'},           -- Optional
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},         -- Required
      {'hrsh7th/cmp-nvim-lsp'},     -- Required
      {'hrsh7th/cmp-buffer'},       -- Optional
      {'hrsh7th/cmp-path'},         -- Optional
      {'saadparwaiz1/cmp_luasnip'}, -- Optional
      {'hrsh7th/cmp-nvim-lua'},     -- Optional

      -- Snippets
      {'L3MON4D3/LuaSnip'},             -- Required
      {'rafamadriz/friendly-snippets'}, -- Optional
    }
  }

  -- Line formatted with VSCode with icons
  use { 'nvim-lualine/lualine.nvim' }

  -- HTML, CSS blazingly fast!
  use ('mattn/emmet-vim')

  -- Autopairs... don't know how to feel about it yet
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- Highlights #hex color code
  use ('norcalli/nvim-colorizer.lua')

  -- File browser
  --use { "nvim-telescope/telescope-file-browser.nvim" }

  -- Line indent for functions/statements
  use { "lukas-reineke/indent-blankline.nvim" }

  -- Side file browser
  use { 'nvim-tree/nvim-tree.lua' }

  -- Icons!
  use { 'nvim-tree/nvim-web-devicons' }

  -- TODO Comments
  use { "folke/todo-comments.nvim" }

  -- Git signs in every file
  use { 'lewis6991/gitsigns.nvim' }

  -- Prettier
  use { 'MunifTanjim/prettier.nvim' }

  -- Null.ls
  use { 'jose-elias-alvarez/null-ls.nvim' }

  -- Discord
  use { 'andweeb/presence.nvim' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
