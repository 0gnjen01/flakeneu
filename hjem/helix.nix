{pkgs, ...}:{
  hjem.users.ignis = {
    rum.programs.helix = {
      enable = true;
      settings = {
        line-number = "relative";
      };
      languages.language.nix = {
        auto-format = true;
        formatter.command = "${pkgs.alejandra}/bin/alejandra";
    
    };
  };
}
