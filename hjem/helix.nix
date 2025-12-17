{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    alejandra
    nixd
    nil
  ];

  hjem.users.ignis = {
    rum.programs.helix = {
      enable = true;
      settings = {
        editor = {
          line-number = "relative";
        };
      };
      languages.language = {
        name = "nix";
        auto-format = true;
        formatter.command = "alejandra";
      };
    };
  };
}
