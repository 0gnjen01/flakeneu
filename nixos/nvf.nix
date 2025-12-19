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
        autopairs.nvim-autopairs.enable = true;

        statusline.lualine.enable = true;

        options = {
          autoindent = true;
          shiftwidth = 2;
        };

        lsp = {
          enable = true;
          formatOnSave = true;
        };

        languages.nix = {
          enable = true;
          extraDiagnostics.enable = true;
          format.enable = true;
          lsp = {
            enable = true;
            servers = ["nil" "nixd"];
          };
        };

        clipboard = {
          enable = true;
          registers = "unnamedplus";
          providers.wl-copy = {
            enable = true;
            package = pkgs.wl-clipboard;
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
