{pkgs, ...}: {
  hjem.users.ignis = {
    environment.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      MANPAGER = "nvim +Man!";
    };
  };

  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        autopairs.nvim-autopairs = {
          enable = true;
        };

        statusline.lualine = {
          enable = true;
        };

        treesitter = {
          enable = true;
        };

        telescope = {
          enable = true;
          extensions = [
            {
              name = "fzf";
              packages = [pkgs.vimPlugins.telescope-fzf-native-nvim];
              setup = {fzf = {fuzzy = true;};};
            }
          ];
        };

        notes.neorg = {
          enable = true;
          setupOpts.load = {
            "core.defaults".enable = true;
            "core.concealer".enable = true;
            "core.dirman".config.workspaces.notes = "~/neorg";
          };
          treesitter.enable = true;
        };

        dashboard.alpha = {
          enable = true;
          theme = "theta";
        };

        options = {
          autoindent = true;
          shiftwidth = 2;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
        };

        languages = {
          nix = {
            enable = true;
            extraDiagnostics.enable = true;
            format.enable = true;
            treesitter.enable = true;
            lsp = {
              enable = true;
              servers = ["nil" "nixd"];
            };
          };
        };

        clipboard = {
          enable = true;
          providers.wl-copy = {
            enable = true;
          };
        };

        extraPlugins = {
          kanso = {
            package = pkgs.vimPlugins.kanso-nvim;
            setup = ''
              vim.cmd.colorscheme("kanso")
            '';
          };
        };
      };
    };
  };
}
