{pkgs, ...}:{

  environment.systemPackages = with pkgs; [
    vesktop
    lazygit
  ];
  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
  ];

}
