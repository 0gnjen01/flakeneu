{pkgs, ...}: {
  stylix = {
    enable = true;
    cursor = {
      name = "Bibata-Modern-Ice";
      size = 24;
      package = pkgs.bibata-cursors;
    };
  };
}
