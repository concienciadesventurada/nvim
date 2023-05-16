require('vscode').load()

return {
  'Mofiqul/vscode.nvim',
  config = function()
    require('vscode').setup {
      style = 'dark',
      transparent = true,
      italic_comments = true,
      disable_nvimtree_bg = true,
    }
  end,
}
