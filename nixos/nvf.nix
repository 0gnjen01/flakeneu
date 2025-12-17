{pkgs, ...}: {
  enviroment.systemPackages = with pkgs; [
    wl-clipboard-rs
  ];

  hjem.users.ignis = {
    enviroment.sessionVariables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
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
          treesitter.enable = true;
          lsp = {
            enable = true;
            servers = ["nil" "nixd"];
          };
        };

        clipboard = {
          enable = true;
          providers.wl-copy.enable = true;
          registers = "unnamed,unnamedplus";
        };
      };
    };
  };
}
