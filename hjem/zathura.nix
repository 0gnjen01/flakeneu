{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    zathura
  ];
  hjem.users.ignis = {
    xdg.config.files."zathura/zathurarc".text = ''
      set selection-clipboard clipboard
    '';
  };
}
