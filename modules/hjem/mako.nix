{
  config,
  lib,
  pkgs,
  ...
}: {
  options.mako = {
    enable = lib.mkEnableOption "enables mako";
  };

  config = lib.mkIf config.mako.enable {
    environment.systemPackages = with pkgs; [
      mako
    ];
    fonts.packages = with pkgs; [
      nerd-fonts.dejavu-sans-mono
    ];
    hjem.users.ignis = {
      xdg.config.files."mako/config".text = ''
        sort=-time
        layer=overlay
        background-color=#23262d
        width=300
        height=110
        border-size=2
        border-color=#c5c9c7
        border-radius=0
        icons=1
        max-icon-size=64
        default-timeout=5000
        ignore-timeout=1
        font=DejaVu Sans Book Mono 13

        [urgency=high]
        border-color=#c4b28a
        default-timeout=0

        [category=mpd]
        default-timeout=2000
        group-by=category
      '';
    };
  };
}
