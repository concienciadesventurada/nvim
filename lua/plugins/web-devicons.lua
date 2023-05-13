return {
  'nvim-tree/nvim-web-devicons',
  config = function()
    require'nvim-web-devicons'.setup {
      override = {
        zsh = {
          icon = "",
          color = "#428850",
          cterm_color = "65",
          name = "Zsh"
        }
      };
      color_icons = true;
      default = true;
      strict = true;
      override_by_filename = {
        [".gitignore"] = {
          icon = "",
          color = "#f1502f",
          name = "Gitignore"
        }
      };
      override_by_extension = {
        ["log"] = {
          icon = "",
          color = "#81e043",
          name = "Log"
        },
        [".json"] = {
          icon = "",
          color = "#ffd500",
          name = "json"
        },
        [".md"] = {
          icon = "",
          color = "#00bbd4",
          name = "md"
        }
      };
    }
  end
}

