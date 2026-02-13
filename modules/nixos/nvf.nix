{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nvf = {
    enable = lib.mkEnableOption "enables nvf";
  };

  config = lib.mkIf config.nvf.enable {
    environment.systemPackages = with pkgs; [
      ripgrep
    ];

    environment.variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
      MANPAGER = "nvim +Man!";
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

          binds = {
            hardtime-nvim.enable = true;
          };

          statusline.lualine = {
            enable = true;
          };

          utility = {
            snacks-nvim = {
              enable = true;
              setupOpts = {
                bigfile.enable = true;
                indent.enable = true;
                quickfile.enable = true;
                explorer.enable = true;
                picker.enable = true;
                notifier.enable = true;
                image.enable = true;
              };
            };
            oil-nvim = {
              enable = true;
              gitStatus.enable = true;
            };
          };

          treesitter = {
            enable = true;
            fold = true;
          };

          git = {
            neogit = {
              enable = true;
            };
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
                    };
                  };
                  "core.completion".config.engine.module_name = "external.lsp-completion";
                  "external.interim-ls".config.enable = true;
                  "core.export".enable = true;
                };
              };
            };
          };

          options = {
            autoindent = true;
            shiftwidth = 2;
            conceallevel = 2;
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
            clang = {
              enable = true;
              dap.enable = true;
              cHeader = true;
              lsp.enable = true;
              treesitter.enable = true;
            };
            html = {
              enable = true;
              extraDiagnostics.enable = true;
              format.enable = true;
              lsp.enable = true;
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
          keymaps = [
            {
              action = "<cmd>Neogit<cr>";
              key = "<leader>gg";
              mode = "n";
              desc = "Open Neogit UI";
            }
            {
              action = "<cmd>lua Snacks.picker.recent()<CR>";
              key = "<leader>fr";
              mode = "n";
              desc = "Recent files";
            }
            {
              action = "<cmd>lua Snacks.picker.files()<CR>";
              key = "<leader>ff";
              mode = "n";
              desc = "Find Files";
            }
            {
              action = "<cmd>lua Snacks.picker.diagnostics()<CR>";
              key = "<leader>d";
              mode = "n";
              desc = "Show diagnostics";
            }
            {
              action = "<cmd>lua Snacks.picker.grep()<CR>";
              key = "<leader>fs";
              mode = "n";
              desc = "Rip-grep";
            }
          ];
        };
      };
    };
  };
}
