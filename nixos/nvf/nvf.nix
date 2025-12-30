{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    ripgrep
    skim
  ];
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
        autocomplete = {
          blink-cmp = {
            enable = true;
          };
        };

        autopairs = {
          nvim-autopairs = {
            enable = true;
          };
        };

        binds = {
          hardtime-nvim.enable = true;
        };

        statusline.lualine = {
          enable = true;
        };

        treesitter = {
          enable = true;
        };

        notes = {
          neorg = {
            enable = true;
            treesitter.enable = true;
            setupOpts = {
              load = {
                "core.defaults".enable = true;
                "core.concealer".enable = true;
                "core.dirman".config = {
                  index = "~/neorg/index.norg";
                  default_workspace = "main";
                  workspaces = {
                    main = "~/neorg/main";
                    journal = "~/neorg/journal/";
                    study = "~/neorg/study";
                    books = "~/neorg/books";
                    thinking = "~/neorg/thinking";
                  };
                };
                "core.journal".config.workspace = "journal";
                "core.completion".config.engine.module_name = "external.lsp-completion";
                "external.interim-ls".config.enable = true;
              };
            };
          };
        };

        options = {
          autoindent = true;
          shiftwidth = 2;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
          inlayHints.enable = true;
        };

        diagnostics = {
          enable = true;
          nvim-lint = {
            enable = true;
          };
        };

        git = {
          neogit = {
            enable = true;
          };
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

        extraPlugins = with pkgs.vimPlugins; {
          kanso = {
            package = kanso-nvim;
            setup = ''
              vim.cmd.colorscheme("kanso")
            '';
          };
          neorg-interim-ls = {
            package = neorg-interim-ls;
          };
        };
      };
    };
  };
}
