{...}:{
  programs.nvf = {
    enable = true;
    
    settings = {
      vim = {
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
            servers = [ "nil" "nixd" ];
          };
        };
        clipboard = {
          enable = true;
          wl-copy.enable = true;
          registers = "unnamed,unnamedplus";
        };
      };
    };
  };
}
